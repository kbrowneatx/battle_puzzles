class Division < ActiveRecord::Base
  attr_accessible :name, :battalions_attributes
  
  belongs_to :army
  has_many :battalions, :dependent => :destroy

  accepts_nested_attributes_for :battalions, :reject_if => lambda { |a| a[:name].blank? } , :allow_destroy => true
end
