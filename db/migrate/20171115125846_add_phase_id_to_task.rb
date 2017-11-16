class AddPhaseIdToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :phase, index: true, foreign_key: true
  end
end
