module Customer
  module Model
    module OrmDriven
      class Customer < ApplicationRecord
        self.table_name = "customers_orm_driven_customers"

        validates :city, :street, :name, :birthday, presence: true

        validates_with PhoneSyntaxValidator
        validates :phone, uniqueness: true

        validates_with EmailSyntaxValidator
        validates :email, uniqueness: true

        validate :birthday_in_the_past

        has_many :rates

        private

        def birthday_in_the_past
          errors.add(:birthday, "is in the future") if birthday&.future?
        end
      end
    end
  end
end
