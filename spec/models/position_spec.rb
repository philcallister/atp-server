# == Schema Information
#
# Table name: positions
#
#  id                  :integer         not null, primary key
#  date_open           :date
#  date_closed         :date
#  ticker              :string(255)
#  start_price         :decimal(10, 4)
#  max_price           :decimal(10, 4)
#  scale_in_low_price  :decimal(10, 4)
#  scale_in_high_price :decimal(10, 4)
#  scale_out_price     :decimal(10, 4)
#  report_url          :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

ALERTS = 3
ALERT_RECENT_DATE = '2011-08-01'

def add_alerts(position)
  ALERTS.times do |t|
    # recent date for first alert
    if (t == 0)
      position.alerts << Alert.make!(:position => position, 
                                     :date => (Date.parse ALERT_RECENT_DATE))
    else
      position.alerts << Alert.make!(:position => position)
    end
  end
  position
end

describe Position do

  #############################################################################
  # Validations
  it { should validate_presence_of(:date_open) }
  it { should validate_presence_of(:ticker) }
  it { should validate_presence_of(:start_price) }
  it { should validate_presence_of(:scale_in_high_price) }
  it { should validate_presence_of(:report_url) }

  #############################################################################
  # Associations
  it { should have_many(:alerts) }

  #############################################################################
  # Creation

  it "should be created" do
    position = Position.make!
    position.date_open.should == Date.parse('2011-07-25')
    position.ticker.should == 'abcd'
    position.start_price.should == 999999.9999
    position.is_open?.should == false
  end

  #############################################################################
  # Open / Closed

  it "should be open / should NOT be closed" do
    position = Position.make(:date_closed => nil)
    position.is_open?.should == true
    position.is_closed?.should == false
  end
  it "should NOT be open / should be closed" do
    position = Position.make
    position.is_open?.should == false
    position.is_closed?.should == true
  end

  #############################################################################
  # Max Upside
  
  it "should have a max upside using scale_in_low_price" do
    position = Position.make
    position.max_upside.should == 4.47
  end
  it "should have a max upside using scale_in_high_price" do
    position = Position.make(:scale_in_low_price => nil)
    position.max_upside.should == 4.39
  end
  it "should have 0% max upside -- no scale_in_low_price or max_price" do
    position = Position.make(:scale_in_low_price => nil, :max_price => nil)
    position.max_upside.should == 0
  end
  it "should have 0% max upside -- no max_price" do
    position = Position.make(:max_price => nil)
    position.max_upside.should == 0
  end

  #############################################################################
  # Finders
  
  it "should find all open positions and latest alert for each" do
    # setup
    2.times do
      add_alerts(Position.make!(:date_closed => nil)) # 2 open positions
    end
    add_alerts(Position.make!) # closed position

    # find open positions and latest alert for each
    positions = Position.find_open_with_recent_alert
    positions.length.should == 2
    positions.each do |p|
      p.recent_alert.date.should == (Date.parse ALERT_RECENT_DATE)
    end

  end

end
