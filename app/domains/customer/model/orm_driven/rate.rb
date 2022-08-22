module Customer
  module Model
    module OrmDriven
      class Rate < ApplicationRecord
        self.table_name = "customers_orm_driven_rates"

        belongs_to :customer, dependent: :destroy
        belongs_to :rated_customer, class_name: "Customer::Model::OrmDriven::Customer"
      end
    end
  end
end
