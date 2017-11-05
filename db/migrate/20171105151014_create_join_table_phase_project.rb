class CreateJoinTablePhaseProject < ActiveRecord::Migration
  def change
    create_join_table :Phases, :Projects do |t|
      # t.index [:phase_id, :project_id]
      # t.index [:project_id, :phase_id]
    end
  end
end
