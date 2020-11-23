class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|

     t.string :name, null: false
     t.string :level, default: 0, null: false

      t.timestamps
    end
  end
end
