class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_time, null: false
      t.integer  :content_id, null: false
      t.string  :assisted,   null: false 
      t.references :user,     null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps

    end
  end
end
