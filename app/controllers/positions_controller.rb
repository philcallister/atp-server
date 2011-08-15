require 'json'
require 'net/http'

class PositionsController < ApplicationController

  respond_to :json

  def index 
  	@positions = Position.find_open_with_recent_alert

  	# TODO Hack slash here...this should move into a job that runs every
  	# x-minutes and updates the positions directly into DB
  	@positions.each do |position|
  		quote(position)
  	end

    respond_with(@positions)
  end

  # TODO Hack slash here...this should move into a job that runs every
  # x-minutes and updates the positions directly into DB
  def quote(position)
    base_url = 'http://query.yahooapis.com/v1/public/yql'
    query = "select * from yahoo.finance.quotes where symbol in (\"#{position.ticker}\")"
    params = "&format=json&env=store://datatables.org/alltableswithkeys"
    url = "#{base_url}?q=#{URI.encode(query)}#{URI.encode(params)}"
    data = (Net::HTTP.get_response(URI.parse(url))).body
    result = JSON.parse(data)
    unless result.has_key?('Error')
      quote = result['query']['results']['quote']
      position.price = quote['LastTradePriceOnly']
      position.direction = quote['Change'][0]
      position.change = quote['Change'][1..quote['Change'].length - 1]
      position.percent = quote['PercentChange'][1..quote['PercentChange'].length - 1]
    end
  end

end
