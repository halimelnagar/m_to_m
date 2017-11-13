class System < ActiveRecord::Base
	has_many :impacted_systems, inverse_of: :system
	has_many :projects, through: :impacted_systems
  has_many :tasks, through: :impacted_systems, inverse_of: :system

  has_many :system_team_phases
  has_many :teams, through: :system_team_phases
  # has_many :systems_teams, inverse_of: :system
  # has_and_belongs_to_many :teams, inverse_of: :systems
  # has_many :systems_teams, inverse_of: :system
  # has_many :teams, through: :systems_teams
  
	# validates :team, presence: true
end
