collection @alerts
attributes :action, :comment
node(:day) { |alert| day(alert.date) }
node(:month) { |alert| month(alert.date) }