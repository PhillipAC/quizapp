class Question < ActiveRecord::Base
    belongs_to :category
    belongs_to :game
    
    accepts_nested_attributes_for :game
end
