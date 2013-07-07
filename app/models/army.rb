class Army < ActiveRecord::Base
  attr_accessible :name, :era_id, :nation_id, :divisions_allowed, :battalions_allowed, :total_xp, :user_id, :divisions_attributes

  belongs_to :user
  belongs_to :era
  belongs_to :nation
  has_many :divisions, :dependent => :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  default_scope order('updated_at DESC')

  accepts_nested_attributes_for :divisions, :reject_if => lambda { |a| a[:name].blank? } , :allow_destroy => true
end