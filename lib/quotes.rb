module Quotes

  SECONDS = 5 * 60 # expire ticker after 5 minutes

  def quote(position)

    # Have ticker -- Fill position with quote info
    if REDIS.exists(position.ticker)
      position.price = REDIS.hget(position.ticker, 'price')
      position.is_up = REDIS.hget(position.ticker, 'is_up')
      position.change = REDIS.hget(position.ticker, 'change')
      position.percent = REDIS.hget(position.ticker, 'percent')

    # No ticker -- let's retrieve from YAHOO!
    else
      retrieve(position)
      REDIS.hset(position.ticker, 'price', position.price)
      REDIS.hset(position.ticker, 'is_up', position.is_up)
      REDIS.hset(position.ticker, 'change', position.change)
      REDIS.hset(position.ticker, 'percent', position.percent)
      REDIS.expire(position.ticker, SECONDS)
    end

  end

  private

    def retrieve(position)
      base_url = 'http://query.yahooapis.com/v1/public/yql'
      query = "select * from yahoo.finance.quotes where symbol in (\"#{position.ticker}\")"
      params = "&format=json&env=store://datatables.org/alltableswithkeys"
      url = "#{base_url}?q=#{URI.encode(query)}#{URI.encode(params)}"
      data = (Net::HTTP.get_response(URI.parse(url))).body
      result = JSON.parse(data)
      unless result.has_key?('Error')
        quote = result['query']['results']['quote']
        position.price = quote['LastTradePriceOnly']
        position.is_up = (quote['Change'][0] == '+')
        position.change = quote['Change'][1..quote['Change'].length - 1]
        position.percent = quote['PercentChange'][1..quote['PercentChange'].length - 1]
      end
    end

end