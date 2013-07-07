class UnitType < ActiveRecord::Base

  belongs_to :nation
  attr_accessible :img_name, :name, :nation_id

  def self.of_nat(natid)
    if natid
      where('nation_id == ?', natid.to_i)
    else
      scoped
    end
  end

end
