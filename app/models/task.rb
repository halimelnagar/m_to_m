class Task < ActiveRecord::Base
	belongs_to :impacted_system #-> { includes :project }
  # has_one :project, through: :impacted_system, foreign_key: :project_id
  belongs_to :project

  belongs_to :system_team_phase, foreign_key: :system_team_phase_id
  has_one :system, through: :system_team_phase, foreign_key: :system_id
	has_one :team, through: :system_team_phase, foreign_key: :team_id
	has_one :phase, through: :system_team_phase, foreign_key: :phase_id

  # mark_for_deletion
  # def self.update_project_tasks(project)
  #   Rails.logger.debug this_method_name + ' start'
  #   tasks = Task.find_by(project_id: project.id)
  #   Rails.logger.debug tasks.size if tasks.any?

  #   project.phases.each do |p|
  #     if p.phase_level.name == 'Project'
  #       task = nil
  #       task = Task.where(project: self, name: p.name).first if self.persisted?
  #       task ||= Task.new(name: p.name, status: false)
  #       self.tasks << task
  #     end
  #   end  
  # end





  # private 
  #   def this_method_name
  #       caller[0] =~ /`([^']*)'/ and $1
  #   end
end