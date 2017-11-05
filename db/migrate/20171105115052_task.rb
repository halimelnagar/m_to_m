class Task < ActiveRecord::Migration
  def change
  	create_table :tasks do |t|
    	t.string :name
    	t.integer :impacted_system_id
    end
  	
  end
end
