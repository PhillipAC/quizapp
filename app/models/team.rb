class Team < ActiveRecord::Base
    before_save {self.name = name.downcase.gsub(/[^0-9a-z]/i, '')}
    validates(:name, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false })
    
    has_many :memberships, dependent: :destroy
    has_many :leaderships, dependent: :destroy
    has_many :members, through: :memberships, source: :user
    has_many :coaches, through: :leaderships, source: :user
    
    has_many :matchups, dependent: :destroy
    has_many :matches, through: :matchups
end
