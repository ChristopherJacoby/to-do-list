class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :room
      t.string :assigned
      t.integer :allowance
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
