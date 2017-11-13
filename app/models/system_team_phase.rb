class SystemTeamPhase < ActiveRecord::Base
  belongs_to :system
  belongs_to :team
  belongs_to :phase
  has_many :tasks, foreign_key: :system_team_phase_id
end
