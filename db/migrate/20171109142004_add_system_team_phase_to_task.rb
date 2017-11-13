class AddSystemTeamPhaseToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :system_team_phase, index: true, foreign_key: true
  end
end
