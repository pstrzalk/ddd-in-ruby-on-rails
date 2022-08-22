module Customer
  module Model
    module WithPersonModel
      class Customer < ApplicationRecord
        self.table_name = "customers_with_person_model_customers"

        AlreadyRated = Class.new(StandardError)
        CannotRateSelf = Class.new(StandardError)

        composed_of :address,
                    class_name: "Customer::Model::WithPersonModel::Address",
                    mapping: [%w[city city], %w[street street]]
        validates_with AddressValidator

        validates :phone, uniqueness: true
        validates_with PhoneSyntaxValidator

        has_one :person
        has_many :rates
      end
    end
  end
end
