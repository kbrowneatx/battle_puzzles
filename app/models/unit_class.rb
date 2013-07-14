class UnitClass < ActiveRecord::Base
  attr_accessible :internal_name, :move_pts, :name, :spec_pts, :strike_pts

  def self.selectable
    where('id < 8')
  end
end
