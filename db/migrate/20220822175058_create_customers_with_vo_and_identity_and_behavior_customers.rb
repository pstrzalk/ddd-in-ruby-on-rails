class CreateCustomersWithVoAndIdentityAndBehaviorCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_with_vo_and_identity_and_behavior_customers do |t|
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
