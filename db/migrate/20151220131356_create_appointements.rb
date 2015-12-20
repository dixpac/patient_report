class CreateAppointements < ActiveRecord::Migration
  def change
    create_table :appointements do |t|
      t.references :patient, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
