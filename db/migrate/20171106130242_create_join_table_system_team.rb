class CreateJoinTableSystemTeam < ActiveRecord::Migration
  def change
    create_join_table :Systems, :Teams do |t|
      # t.index [:system_id, :team_id]
      # t.index [:team_id, :system_id]
    end
  end
end
