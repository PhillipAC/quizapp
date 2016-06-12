class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save {self.username = username.downcase.gsub(/[^0-9a-z]/i, '')}
  before_save {self.first_name = first_name.downcase.gsub(/[^0-9a-z]/i, '')}
  before_save {self.last_name = last_name.downcase.gsub(/[^0-9a-z]/i, '')}
  validates(:username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false })
  
  has_many :memberships, dependent: :destroy
  has_many :leaderships, dependent: :destroy
  
  has_many :teams, through: :memberships, source: :team
  has_many :coaching_teams, through: :leaderships, source: :team
  
  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
