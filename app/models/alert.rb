# == Schema Information
#
# Table name: alerts
#
#  id          :integer         not null, primary key
#  position_id :integer
#  date        :date
#  comment     :string(255)
#  action      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Alert < ActiveRecord::Base

  validates_presence_of :date

  belongs_to :position

end

