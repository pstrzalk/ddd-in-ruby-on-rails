class CreateCustomersOrmDrivenCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_orm_driven_customers do |t|
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
