class Task < ActiveRecord::Base
	belongs_to :impacted_system #-> { includes :project }
  # has_one :project, through: :impacted_system, foreign_key: :project_id
  belongs_to :project
  
  belongs_to :system_team_phase, foreign_key: :system_team_phase_id
  has_one :system, through: :system_team_phase, foreign_key: :system_id
	has_one :team, through: :system_team_phase, foreign_key: :team_id
	has_one :phase, through: :system_team_phase, foreign_key: :phase_id

end