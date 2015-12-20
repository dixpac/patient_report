class CreateAppointementIndicators < ActiveRecord::Migration
  def change
    create_table :appointement_indicators do |t|
      t.references :appointement, index: true, foreign_key: true
      t.references :indicator, index: true, foreign_key: true
      t.string :result
      t.string :range
      t.boolean :in_range

      t.timestamps null: false
    end
  end
end
