class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.string :title, null: false
      t.text :body
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.boolean :disp_flag, default: true
      t.string :allday

      t.timestamps
    end
  end
end
