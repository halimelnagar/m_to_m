class AddColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :smo_id, :integer
    add_index :projects, :smo_id, unique: true
    add_reference :projects, :type, index: true, foreign_key: true
    add_reference :projects, :complexity, index: true, foreign_key: true
    add_reference :projects, :priority, index: true, foreign_key: true
  end
end
