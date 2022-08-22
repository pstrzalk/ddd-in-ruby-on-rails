class CreateCustomersWithPersonModelCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_with_person_model_customers do |t|
      t.string :phone
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
