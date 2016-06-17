class Game < ActiveRecord::Base
    belongs_to :season
    has_many :questions
    has_many :matches
    
    accepts_nested_attributes_for :season
end
