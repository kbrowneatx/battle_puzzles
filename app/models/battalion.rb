class Battalion < ActiveRecord::Base
  attr_accessible :health, :name, :division_id, :unit_type_id

  belongs_to :division
  belongs_to :unit_type
end
