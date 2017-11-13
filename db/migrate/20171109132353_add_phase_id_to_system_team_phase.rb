class AddPhaseIdToSystemTeamPhase < ActiveRecord::Migration
  def change
     add_column :system_team_phases, :phase_id, :integer, index: true, foreign_key: true
  end

  def down
    remove_column :system_team_phases, :phase_id    
  end
end
