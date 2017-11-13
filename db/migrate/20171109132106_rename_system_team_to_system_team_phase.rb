class RenameSystemTeamToSystemTeamPhase < ActiveRecord::Migration
  def change
    rename_table :system_teams, :system_team_phases
  end
end
