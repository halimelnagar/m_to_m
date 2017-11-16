class AddSystemIdToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :System, index: true, foreign_key: true
  end
end
