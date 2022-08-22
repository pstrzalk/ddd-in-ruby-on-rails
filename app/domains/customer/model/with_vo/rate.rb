module Customer
  module Model
    module WithVo
      class Rate < ApplicationRecord
        self.table_name = "customers_with_vo_rates"

        belongs_to :customer, dependent: :destroy
        belongs_to :rated_customer, class_name: "Customer::Model::WithVo::Customer"
      end
    end
  end
end
