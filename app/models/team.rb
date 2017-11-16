class Team < ActiveRecord::Base
  has_many :system_team_phases, foreign_key: :team_id
  has_many :systems, through: :system_team_phases
  has_many :phases, through: :system_team_phases
  
  # has_many :tasks, through: :system_team_phases
  # has_many :systems_teams, inverse_of: :team
  # has_and_belongs_to_many :systems, inverse_of: :teams

	# has_many :tasks, through: :systems, inverse_of: :team
  # has_many :open_tasks, -> { where status: true }, through: :systems, class_name:"Task" 
  # has_many :systems_teams, inverse_of: :team
  # has_many :systems, through: :systems_teams
  # accepts_nested_attributes_for :open_tasks
  
  def tasks
    Task.joins(:system_team_phase).where(system_team_phases: {team_id: self.id})    
  end

  def open_tasks
    Task.joins(:system_team_phase).where(status: false, system_team_phases: {team_id: self.id})
  end
end
