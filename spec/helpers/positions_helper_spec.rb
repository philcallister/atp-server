require 'spec_helper'

describe PositionsHelper do

  #############################################################################
  # Price Formatted
  
  it "should format price to 2 decimal places" do
    position = Position.make
    helper.price_formatted(position.max_price).should == "42.10"
  end
  it "should format price to 2 decimal places -- starting with 4" do
    position = Position.make(:max_price => 65.4888)
    helper.price_formatted(position.max_price).should == "65.49"
  end
  it "should format price to 2 decimal places -- no max_price" do
    position = Position.make(:max_price => nil)
    helper.price_formatted(position.max_price).should == "0.00"
  end

  #############################################################################
  # Percent Formatted
  
  it "should format percent of max upside using scale_in_low_price" do
    position = Position.make
    helper.percent_formatted(position.max_upside).should == "4.47%"
  end
  it "should format percent of max upside using scale_in_high_price" do
    position = Position.make(:scale_in_low_price => nil)
    helper.percent_formatted(position.max_upside).should == "4.39%"
  end
  it "should format percent 0% max upside -- no scale_in_low_price or max_price" do
    position = Position.make(:scale_in_low_price => nil, :max_price => nil)
    helper.percent_formatted(position.max_upside).should == "0.00%"
  end
  it "should format percent 0% max upside -- no max_price" do
    position = Position.make(:max_price => nil)
    helper.percent_formatted(position.max_upside).should == "0.00%"
  end

end
