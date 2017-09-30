class CreateDeniedCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :denied_customers do |t|
      t.string :name
      t.integer :cif
      t.integer :id_no
      t.integer :amount
      t.text :purpose
      t.text :explaination
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
