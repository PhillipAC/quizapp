class Game < ActiveRecord::Base
    has_many :questions
    has_many :matches
end
