module Customer
  module Model
    class Customer < ApplicationRecord
      self.table_name = "customer__customers"

      validates :city, :street, :name, :birthday, presence: true

      validates_with PhoneSyntaxValidator
      validates :phone, uniqueness: true

      validates_with EmailSyntaxValidator
      validates :email, uniqueness: true

      validate :birthday_in_the_past

      has_many :rates

      private

      def birthday_in_the_past
        return unless birthday

        errors.add(:birthday, "is in the past") if birthday.future?
      end
    end
  end
end
