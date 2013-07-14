class Battalion < ActiveRecord::Base
  attr_accessible :health, :name, :division_id, :unit_class_id

  belongs_to :division
  belongs_to :unit_class
end
