class CreateCustomersWithVoRates < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_with_vo_rates do |t|
      t.references :customer
      t.references :rated_customer, foreign_key: { to_table: :customers_with_vo_customers }
      t.integer :mark

      t.timestamps
    end
  end
end
