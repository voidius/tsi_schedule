class Group < ActiveRecord::Base
  attr_accessible :code, :name

  validates_presence_of :name
  validates_numericality_of :code, only_integer: true
end
