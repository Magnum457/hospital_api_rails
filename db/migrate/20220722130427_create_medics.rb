class CreateMedics < ActiveRecord::Migration[7.0]
  def change
    create_table :medics do |t|
      t.string :name
      t.string :crm
      t.string :email
      t.string :telephone
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
