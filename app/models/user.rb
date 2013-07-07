class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :gamer_name, :games_allowed, :password, :password_confirmation, :remember_me, :role
  
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :gamer_name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :role, :inclusion => { :in => %w(admin player), :message => "must be admin or player" }
  
  has_many :armies
end
