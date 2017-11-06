class Phase < ActiveRecord::Base
	has_and_belongs_to_many :projects, inverse_of: :projects
	has_many :tasks
end
