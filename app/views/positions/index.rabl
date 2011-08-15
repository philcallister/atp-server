collection @positions
attributes :id, :ticker, :price, :change, :percent, :direction
node(:max_price) { |position| price_formatted(position.max_price) }
node(:max_upside) { |position| percent_formatted(position.max_upside) }
child :recent_alert => :recent_alert do
  attributes :date, :action
end