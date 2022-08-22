module Customer
  module Model
    class Rate < ApplicationRecord
      self.table_name = "customer__rates"

      belongs_to :customer, dependent: :destroy
      belongs_to :rated_customer, class_name: "Customer::Model::Customer"
    end
  end
end
