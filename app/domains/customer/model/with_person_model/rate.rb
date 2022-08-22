module Customer
  module Model
    module WithPersonModel
      class Rate < ApplicationRecord
        self.table_name = "customers_with_person_model_rates"

        belongs_to :customer, dependent: :destroy
        belongs_to :rated_customer, class_name: "Customer::Model::WithPersonModel::Customer"
      end
    end
  end
end
