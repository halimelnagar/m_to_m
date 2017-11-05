class ImpactedSystem < ActiveRecord::Base
	belongs_to :project
	belongs_to :system
end