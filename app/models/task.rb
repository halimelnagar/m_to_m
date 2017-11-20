class Task < ActiveRecord::Base
	belongs_to :impacted_system #-> { includes :project }
  # has_one :project, through: :impacted_system, foreign_key: :project_id
  belongs_to :project

  belongs_to :system_team_phase, foreign_key: :system_team_phase_id
  has_one :system, through: :system_team_phase, foreign_key: :system_id
	has_one :team, through: :system_team_phase, foreign_key: :team_id
	has_one :phase, through: :system_team_phase, foreign_key: :phase_id


  
  def self.create_tasks(project)
    Rails.logger.debug  this_method_name + ' start'
    # tasks = Task.find_by(project_id: project.id)
    # Rails.logger.debug tasks.size if tasks.any?

    project.phases.each do |p|
      puts p.attributes
      puts 'Phase level = ' + p.phase_level.name

      
      if p.phase_level.name == 'Project'
        task = nil
        task = Task.new(name: p.name, status: false)        
        project.tasks << task
      else
        project.impacted_systems.each do |is|
          task = nil
          Rails.logger.debug 'Impacted System'
          puts is.attributes
          task = Task.create(
                system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
                impacted_system: is,
                name: is.system.name + ' - ' + p.name,
                status: false,
                phase_id: p.id, System_id: is.system_id)          
          project.tasks << task
        end
        # project.tasks << task if task != nil
      end

    end  
    Rails.logger.debug caller[0] =~ /`([^']*)'/ and $1 + ' end'
    project
  end

# private section
  private 
    def self.this_method_name
        caller[0] =~ /`([^']*)'/ and $1
    end
end