class System < ActiveRecord::Base
	has_many :impacted_systems
	has_many :projects, through: :impacted_systems
  
  # has_many :systems_teams, inverse_of: :system
  # has_many :teams, through: :systems_teams
  has_and_belongs_to_many :teams, inverse_of: :systems
	validates :teams, presence: true
end
