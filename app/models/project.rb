class Project < ActiveRecord::Base
	
	require 'pp'
	
	before_update :populate_tasks
	before_save :populate_tasks
	after_update :update_tasks
	

	has_many :impacted_systems, dependent: :destroy, inverse_of: :project
	has_many :systems, through: :impacted_systems
	has_many :tasks, through: :impacted_systems, dependent: :destroy
	has_and_belongs_to_many :phases, inverse_of: :projects

  validates :phases, presence: true
  validates :systems, presence: true
  
  	private 
  		def populate_tasks
  			Rails.logger.debug 'halim - start'

  			self.impacted_systems.each do |is|
				# Rails.logger.debug is.system.name
				unless is.tasks.any?
					self.phases.each do |p|
						is.tasks << Task.new(name: is.system.name + ' - ' + p.name)
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
