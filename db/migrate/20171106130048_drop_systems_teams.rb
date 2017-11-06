class DropSystemsTeams < ActiveRecord::Migration
  def change
    drop_table :systems_teams
  end
end
