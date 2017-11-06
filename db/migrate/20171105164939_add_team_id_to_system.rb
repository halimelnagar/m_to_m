class AddTeamIdToSystem < ActiveRecord::Migration
  def change
    add_column :systems, :team_id, :integer
  end
end
