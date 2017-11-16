class ImpactedSystem < ActiveRecord::Base
	belongs_to :project
	belongs_to :system
	has_many :tasks, inverse_of: :impacted_system, dependent: :destroy

	# before_update :populate_tasks
	# before_save :populate_tasks

	private 
  		# def populate_tasks
  		# 	Rails.logger.debug 'halim - start'


				# Rails.logger.debug self.system.name
				# unless self.tasks.any?
				# 	self.tasks << 
				# 			[	
				# 				Task.new(name: self.system.name + ' - Dev'),
				# 				Task.new(name: self.system.name + ' - SIT'),
				# 				Task.new(name: self.system.name + ' - QA'),
				# 			]
					
				# else

				# unless self.tasks.any?
				# 	self.tasks << 
				# 			[	
				# 				Task.new(name: self.system.name + ' - Dev'),
				# 				Task.new(name: self.system.name + ' - SIT'),
				# 				Task.new(name: self.system.name + ' - QA'),
				# 			]
					
				# else
				# end
			

  	# 		self.impacted_systems.each do |is|
  	# 			self.impacted_systems.each do |is|
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