require 'spec_helper'

describe Position do
  it { should validate_presence_of(:date_open) }
  it { should validate_presence_of(:ticker) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:scale_in_high_price) }
  it { should validate_presence_of(:report_url) }
  it { should have_many(:alerts) }
  it "should be created" do
    position = Position.make!
    position.date_open.should == Date.parse('2011-07-25')
    position.ticker.should == 'abcd'
    position.price.should == 999999.9999
    position.is_open?.should == false
  end
  it "should be open / should NOT be closed" do
    position = Position.make!(:date_closed => nil)
    position.is_open?.should == true
    position.is_closed?.should == false
  end
  it "should NOT be open / should be closed" do
    position = Position.make!
    position.is_open?.should == false
    position.is_closed?.should == true
  end
end
