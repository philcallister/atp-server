require 'machinist/active_record'

###############################################################################
# Position

Position.blueprint do
  date_open { Date.parse '2011-07-25' }
  date_closed { Date.parse '2011-07-27' }
  ticker { 'abcd' }
  price { 999999.9999 }
  scale_in_low_price { 40.30 }
  scale_in_high_price { 40.33 }
  scale_out_price { 42.19 }
  report_url { 'http://www.reddit.com' }
end

###############################################################################
# Alert

Alert.blueprint do
  position
  date { Date.parse '2011-07-26' }
  scale_in_comment { 'alert scale-in comment' }
  comment { 'alert comment' }
  action { 'alert action' }
end