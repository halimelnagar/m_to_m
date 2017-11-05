class Project < ActiveRecord::Base
	
	require 'pp'
	
	
	

	has_many :impacted_systems
	has_many :systems, through: :impacted_systems
	has_many :tasks, through: :impacted_systems

  	private 
  	# 	def populate_tasks
  	# 		Rails.logger.debug 'halim - start'

  	# 		self.impacted_systems.each do |is|
			# 	Rails.logger.debug is.system.name
			# 	unless is.tasks.any?
			# 		is.tasks.create([
			# 			{ :name => is.system.name + ' - Dev' }, 
			# 			{ :name => is.system.name + ' - SIT' },
			# 			{ :name => is.system.name + ' - QA' }
						
			# 			])
			# 	else
			# 	end
			# end

			# Rails.logger.debug 'halim - end'
  	# 	end
end
