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

class Position < ActiveRecord::Base

  validates_presence_of :date_open
  validates_presence_of :ticker
  validates_presence_of :start_price
  validates_presence_of :scale_in_high_price
  validates_presence_of :report_url

  has_many :alerts, :order => 'date DESC', :dependent => :destroy
  has_one :recent_alert, :class_name => 'Alert', :order => 'date DESC'

  #############################################################################
  # Instance Methods

  def is_open?
    date_closed ? false : true
  end

  def is_closed?
    !is_open?
  end

  def max_upside
    if (max_price && scale_in_low_price)
      (((max_price - scale_in_low_price) / scale_in_low_price) * 100).round(2)
    elsif (max_price && scale_in_high_price)
      (((max_price - scale_in_high_price) / scale_in_high_price) * 100).round(2)
    else
      (0.0).round(2)
    end
  end

  #############################################################################
  # Class Methods
  class << self

    def find_open_with_recent_alert
      Position.where(:date_closed => nil).includes(:recent_alert)
    end

 end

end

