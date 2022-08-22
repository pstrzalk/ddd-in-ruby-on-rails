class CreateCustomersOrmDrivenRates < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_orm_driven_rates do |t|
      t.references :customer
      t.references :rated_customer, foreign_key: { to_table: :customers_orm_driven_customers }
      t.integer :mark

      t.timestamps
    end
  end
end
