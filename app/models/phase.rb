class Phase < ActiveRecord::Base
	has_and_belongs_to_many :projects, inverse_of: :projects
	has_many :system_team_phases
  has_many :tasks
  belongs_to :phase_level
end
