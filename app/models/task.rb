class Task < ActiveRecord::Base
	belongs_to :impacted_system #-> { includes :project }
  belongs_to :project, foreign_key: :project_id

  belongs_to :system_team_phase, foreign_key: :system_team_phase_id
 #  belongs_to :system, through: :system_team_phase, foreign_key: :system_id
	# belongs_to :team, through: :system_team_phase, foreign_key: :team_id
	# belongs_to :phase, through: :system_team_phase, foreign_key: :phase_id
end