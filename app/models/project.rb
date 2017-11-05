class Project < ActiveRecord::Base
	has_many :impacted_systems
	has_many :systems, through: :impacted_systems
end
