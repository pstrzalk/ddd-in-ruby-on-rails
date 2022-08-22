class CreateCustomersWithPersonModelPersons < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_with_person_model_persons do |t|
      t.string :email
      t.string :name
      t.date :birthday

      t.integer :customer_id

      t.timestamps
    end
  end
end
