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

require 'spec_helper'

describe Alert do
  it { should validate_presence_of(:date)}
  it { should belong_to :position }
  it "should be created" do
    alert = Alert.make!
    alert.position.should_not == nil
    alert.date.should == Date.parse('2011-07-26')
    alert.comment.should == 'alert comment'
    alert.action.should == 'alert action'
  end
end

