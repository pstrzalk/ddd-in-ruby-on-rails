class CreateCustomersInCustomerContext < ActiveRecord::Migration[7.0]
  def change
    create_table :customer__customers do |t|
      t.string :phone
      t.string :email
      t.string :name
      t.string :city
      t.string :street
      t.date :birthday

      t.timestamps
    end
  end
end
