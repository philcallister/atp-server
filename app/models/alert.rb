class Alert < ActiveRecord::Base

  validates_presence_of :date

  belongs_to :position

end
