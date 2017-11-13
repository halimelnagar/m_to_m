class CreateProjectPhases < ActiveRecord::Migration
  def change
    create_table :project_phases do |t|
      t.references :project, index: true, foreign_key: true
      t.references :phase, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
