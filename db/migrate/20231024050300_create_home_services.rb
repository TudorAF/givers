class CreateHomeServices < ActiveRecord::Migration[7.0]
  def change
    create_table :home_services do |t|
      t.string :name
      t.integer :rate
      t.string :description
      t.timestamps
    end
  end
end
