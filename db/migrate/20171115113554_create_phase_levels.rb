class CreatePhaseLevels < ActiveRecord::Migration
  def change
    create_table :phase_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
