class CreateImpactedSystem < ActiveRecord::Migration
  def change
    create_table :impacted_systems do |t|
    	t.integer :project_id
    	t.integer :system_id
    end
  end
end
