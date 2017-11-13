class CreateSystemTeams < ActiveRecord::Migration
  def change
    create_table :system_teams do |t|
      t.references :system, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
