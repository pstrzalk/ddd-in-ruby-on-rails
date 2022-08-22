class CreateCustomersWithVoAndIdentityAndBehaviorRates < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_with_vo_and_identity_and_behavior_rates do |t|
      t.references :customer,
                   index: { name: "index_customers_with_vo_and_identity_and_behavior_rates_c_id" }
      t.references :rated_customer,
                   foreign_key: { to_table: :customers_with_vo_and_identity_and_behavior_customers },
                   index: { name: "index_customers_with_vo_and_identity_and_behavior_rates_oc_id" }
      t.integer :mark

      t.timestamps
    end
  end
end
