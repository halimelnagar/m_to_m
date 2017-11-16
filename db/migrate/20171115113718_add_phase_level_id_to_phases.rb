class AddPhaseLevelIdToPhases < ActiveRecord::Migration
  def change
    add_reference :phases, :phase_level, index: true, foreign_key: true
  end
end
