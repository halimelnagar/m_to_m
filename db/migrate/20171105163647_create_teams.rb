class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :spoc_id
      t.string :email

      t.timestamps null: false
    end
    add_index :teams, :email, unique: true
  end
end
