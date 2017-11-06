class Team < ActiveRecord::Base
	has_many :tasks
	has_many :systems
end
