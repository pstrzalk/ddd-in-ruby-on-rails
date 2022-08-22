module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class Rate < ApplicationRecord
        self.table_name = "customers_with_vo_and_identity_and_behavior_rates"

        belongs_to :customer, dependent: :destroy
        belongs_to :rated_customer, class_name: "Customer::Model::WithVoAndIdentityAndBehavior::Customer"
      end
    end
  end
end
