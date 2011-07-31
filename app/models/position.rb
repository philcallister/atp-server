class Position < ActiveRecord::Base

  validates_presence_of :date_open
  validates_presence_of :ticker
  validates_presence_of :price
  validates_presence_of :scale_in_high_price
  validates_presence_of :report_url

  has_many :alerts

  def is_open?
    date_closed ? false : true
  end

  def is_closed?
    date_closed ? true : false
  end

end
