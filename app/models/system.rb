class System < ActiveRecord::Base
	has_many :impacted_systems
	has_many :projects, through: :impacted_systems
	belongs_to :team
end
