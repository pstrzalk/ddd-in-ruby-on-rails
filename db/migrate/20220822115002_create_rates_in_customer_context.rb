class CreateRatesInCustomerContext < ActiveRecord::Migration[7.0]
  def change
    create_table :customer__rates do |t|
      t.references :customer
      t.references :rated_customer, foreign_key: { to_table: :customer__customers }
      t.integer :mark

      t.timestamps
    end
  end
end
