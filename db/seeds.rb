Alert.create([
  { :action => "Scale in 7.45 - 7.51 range to buy 1/2 position", :comment => "Huge volumes again today. 15% gains for initial buys. Advice to SELL at given range", :created_at => nil, :date => "2011-08-01", :position_id => 1, :updated_at => nil },
  { :action => "Gap at 12.23, BUY 1/2 position to 13", :comment => "Runs up 23% today on huge volume to 12.20.  Recent advice to BUY", :created_at => nil, :date => "2011-08-02", :position_id => 1, :updated_at => nil },
  { :action => "Max 19.45 to buy 1/2 position", :comment => "Pullback on lower volumes today. Advice to BUY at given range", :created_at => nil, :date => "2011-08-05", :position_id => 2, :updated_at => nil },
  { :action => "SELL remaining, place stop at 15.29", :comment => "This one has run its course. Advice to SELL before hits stop value", :created_at => nil, :date => "2011-08-08", :position_id => 2, :updated_at => nil }
])



Position.create([
  { :created_at => "2011-08-01 00:00:00", :date_closed => nil, :date_open => "2011-08-01", :max_price => 9.23, :report_url => "www.reddit.com", :scale_in_high_price => 7.51, :scale_in_low_price => 7.45, :scale_out_price => nil, :start_price => 7.40, :ticker => "SQNS", :updated_at => nil },
  { :created_at => nil, :date_closed => nil, :date_open => "2011-08-05", :max_price => 25.18, :report_url => "www.activetradingpartners.com", :scale_in_high_price => 23.38, :scale_in_low_price => 23.35, :scale_out_price => nil, :start_price => 23.31, :ticker => "DDD", :updated_at => nil }
])


