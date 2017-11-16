class Project < ActiveRecord::Base
	
	require 'pp'
	
	before_update :populate_tasks
	before_save :populate_tasks
	# after_update :update_tasks
  
  belongs_to :type
  belongs_to :priority
  belongs_to :complexity	

	has_many :impacted_systems, foreign_key: :project_id, dependent: :destroy, inverse_of: :project
	has_many :systems, through: :impacted_systems
	# has_many :tasks, through: :impacted_systems, foreign_key: :project_id, dependent: :destroy, inverse_of: :project
  has_many :tasks, dependent: :destroy
	has_and_belongs_to_many :phases, inverse_of: :projects
  
  validates :phases, presence: true
  validates :systems, presence: true
  validates :type, presence: true
  validates :priority, presence: true
  validates :complexity, presence: true

  # has_one :project_manager, -> { where role: 'project_manager' }, class_name: "User"
  # has_one :credit_card, dependent: :destroy  # destroys the associated credit card
  # has_one :credit_card, dependent: :nullify  # updates the associated records foreign
  #                                               # key value to NULL rather than destroying it
  # has_one :last_comment, -> { order 'posted_on' }, class_name: "Comment"
  # has_one :project_manager, -> { where role: 'project_manager' }, class_name: "Person"
  # has_one :attachment, as: :attachable
  # has_one :boss, -> { readonly }
  # has_one :club, through: :membership
  # has_one :primary_address, -> { where primary: true }, through: :addressables, source: :addressable
  # has_one :credit_card, required: true

  def self.search(param)
    return Project.none if param.blank?

    param.strip!
    param.downcase!
    # name_matches(param)

    (smo_matches(param) + name_matches(param)).uniq
  end

  def self.smo_matches(param)
    # matches('smo_id', param)    
    # where("smo_id: #{param}")
    where("smo_id = ?", param)
  end

  def self.name_matches(param)
    matches('name', param)
  end

  def self.matches(field_name, param)
    # where("#{field_name}: #{param}") if param.class == Integer
    p = where("lower(#{field_name}) like ?", "%#{param}%")
    # Rails.logger.debug 'halim - start'
    Rails.logger.debug p.size
    # Rails.logger.debug 'halim - end'
    return p
  end
  
	private 
    def this_method_name
        caller[0] =~ /`([^']*)'/ and $1
    end

  def populate_tasks
    Rails.logger.debug this_method_name + ' start'
    self.tasks.where('impacted_system_id not in (?)', self.impacted_systems.map(&:id)).destroy_all
    self.tasks.where('phase_id not in (?)', self.phases.map(&:id)).destroy_all
    self.phases.each do |p|
      Rails.logger.debug 'Phase - '+p.name
      task = nil
      if p.phase_level.name == 'Project'
        task = Task.where(project: self, name: p.name).first if self.persisted?
        task ||= Task.new(name: p.name, phase_id: p.id, status: false)
        self.tasks << task
      else #### it is System level
        self.impacted_systems.each do |is|
          Rails.logger.debug 'IS - '+is.id.to_s

          task = Task.where(project: self, system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
              impacted_system: is,name: is.system.name + ' - ' + p.name).first  if self.persisted?
          
          task ||= Task.create(
                system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
                impacted_system: is,
                name: is.system.name + ' - ' + p.name,
                status: false,
                phase_id: p.id, System_id: is.system_id)
          self.tasks << task
        end          
      end
    end      
    Rails.logger.debug this_method_name + ' end'
  end #---- end method populate tasks
		# def populate_tasks
  #     Rails.logger.debug this_method_name + ' start'
			
  #     self.phases.each do |p|
  #       if p.phase_level.name == 'Project'
  #         task = nil
  #         task = Task.where(project: self, name: p.name).first if self.persisted?
  #         task ||= Task.new(name: p.name, status: false)
  #         self.tasks << task
  #       end
  #     end

  #     self.impacted_systems.each do |is|
  #       Rails.logger.debug is.id 
         
  #       self.phases.each do |p|
  #         task = nil
  #         Rails.logger.debug 'Phase level is '+p.phase_level.name
  #         unless p.phase_level.name == 'Project'
  #           # unless self.tasks.any?
  #           task = Task.where(project: self, system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
  #               impacted_system: is,name: is.system.name + ' - ' + p.name).first  if self.persisted?
            
  #           Rails.logger.debug task.id if task.present?
  #           Rails.logger.debug '# of tasks before addition is ' + self.tasks.size.to_s
  #           # Rails.logger.debug 'task is '+ task.id + ', '+ task.name
  #           task ||= Task.create(
  #               system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
  #               impacted_system: is,
  #               name: is.system.name + ' - ' + p.name,
  #               status: false)
  #           Rails.logger.debug 'task is '+ task.id.to_s + ', '+ task.name
  #             self.tasks << task
  #             Rails.logger.debug '# of tasks after addition is ' + self.tasks.size.to_s
  #           # end
  #         end # --- end unless          
  #       end #---- end loop phases        
  #     end #-- end loop impacted systems

  #     Rails.logger.debug this_method_name + ' end'
  #   end #---- end method populate tasks

  		# 	self.impacted_systems.each do |is|
				# # Rails.logger.debug is.system.name
				# unless is.tasks.any?
				# 	self.phases.each do |p|
    #         is.tasks << Task.new(
    #           system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
    #           impacted_system: is,
    #           name: is.system.name + ' - ' + p.name,
    #           status: false)
					# end
					# unless is.tasks.any?
					# 	is.tasks.create([
					# 		{ :name => is.system.name + ' - Dev' }, 
					# 		{ :name => is.system.name + ' - SIT' },
					# 		{ :name => is.system.name + ' - QA' }
							
					# 		])
					# else
					# end
				
				# end

		# end

			# Rails.logger.debug 'halim - end'
  	# 	end

  		def update_tasks # nothing is impacted with this method. To be investigated
        this_method_name
  			self.impacted_systems.each do |is|
          Rails.logger.debug is.id
	  			is.tasks.each do |t|
					Rails.logger.debug t.name + ' ' + t.status.to_s
					# t.save
				end
			end
  			
  		end
end
