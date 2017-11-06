class Team < ActiveRecord::Base
	has_many :tasks

  
	has_and_belongs_to_many :systems, inverse_of: :teams
  # has_many :systems_teams, inverse_of: :team
  # has_many :systems, through: :systems_teams
end
