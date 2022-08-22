module Customer
  module Model
    module WithPersonModel
      class Person < ApplicationRecord
        self.table_name = "customers_with_person_model_persons"

        validates_with PersonValidator
      end
    end
  end
end
