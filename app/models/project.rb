class Project < ActiveRecord::Base
	
	require 'pp'
	
	before_update :populate_tasks
	before_save :populate_tasks
	after_update :update_tasks
	

	has_many :impacted_systems, foreign_key: :project_id, dependent: :destroy, inverse_of: :project
	has_many :systems, through: :impacted_systems
	has_many :tasks, through: :impacted_systems, foreign_key: :project_id, dependent: :destroy, inverse_of: :project
	has_and_belongs_to_many :phases, inverse_of: :projects
  
  validates :phases, presence: true
  validates :systems, presence: true

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


  
  	private 
  		def populate_tasks
  			Rails.logger.debug 'halim - start'

  			self.impacted_systems.each do |is|
				# Rails.logger.debug is.system.name
				unless is.tasks.any?
					self.phases.each do |p|
            is.tasks << Task.new(
              system_team_phase: SystemTeamPhase.find_by(system: is.system , phase: p),
              impacted_system: is,
              name: is.system.name + ' - ' + p.name,
              status: false)
					end
					# unless is.tasks.any?
					# 	is.tasks.create([
					# 		{ :name => is.system.name + ' - Dev' }, 
					# 		{ :name => is.system.name + ' - SIT' },
					# 		{ :name => is.system.name + ' - QA' }
							
					# 		])
					# else
					# end
				
				end

			end

			Rails.logger.debug 'halim - end'
  		end

  		def update_tasks # nothing is impacted with this method. To be investigated
  			self.impacted_systems.each do |is|
	  			is.tasks.each do |t|
					Rails.logger.debug t.name + t.status.to_s
					# t.save
				end
			end
  			
  		end
end
