module PositionsHelper

  def price_formatted(price)
    (price) ? format("%.2f", price) : "0.00"
  end

  def percent_formatted(percent)
    (percent) ? format("%.2f%", percent) : "0.00%"
  end

end
