class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.date :birthdate
      t.string :cancer
      t.string :journey_step
      t.datetime :last_active_at

      t.timestamps
    end
  end
end
