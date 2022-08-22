module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class Customer < ApplicationRecord
        self.table_name = "customers_with_vo_and_identity_and_behavior_customers"

        AlreadyRated = Class.new(StandardError)
        CannotRateSelf = Class.new(StandardError)

        composed_of :address,
                    class_name: "Customer::Model::WithVoAndIdentityAndBehavior::Address",
                    mapping: [%w[city city], %w[street street]]
        validates_with AddressValidator

        composed_of :personal_information,
                    class_name: "Customer::Model::WithVoAndIdentityAndBehavior::PersonalInformation",
                    mapping: [%w[name name], %w[birthday birthday], %w[email email]]
        validates_with PersonalInformationValidator

        validates_with PhoneSyntaxValidator
        validates :phone, uniqueness: true

        has_many :rates

        def give_negative_rate(other)
          give_rate(other, -1)
        end

        def give_neutral_rate(other)
          give_rate(other, 0)
        end

        def give_positive_rate(other)
          give_rate(other, 1)
        end

        private

        def give_rate(other, mark)
          raise CannotRateSelf if other == self
          raise AlreadyRated if rates.any? { |rate| rate.rated_customer == other }

          rates.build(rated_customer: other, mark: mark)
        end
      end
    end
  end
end
