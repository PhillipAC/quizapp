class Match < ActiveRecord::Base
    belongs_to :game
    belongs_to :reader, source: :user
    has_many :matchups, dependent: :destroy
    has_many :teams, through: :matchups
    
    accepts_nested_attributes_for :game, :reader
end
