require 'spec_helper'

describe Alert do
  it { should validate_presence_of(:date)}
  it { should belong_to :position }
  it "should be created" do
    alert = Alert.make!
    alert.position.should_not == nil
    alert.date.should == Date.parse('2011-07-26')
    alert.scale_in_comment.should == 'alert scale-in comment'
    alert.comment.should == 'alert comment'
    alert.action.should == 'alert action'
  end
end
