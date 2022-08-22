module Customer
  module Model
    module WithVo
      class Customer < ApplicationRecord
        self.table_name = "customers_with_vo_customers"

        composed_of :address,
                    class_name: "Customer::Model::WithVo::Address",
                    mapping: [%w[city city], %w[street street]]
        validates_with AddressValidator

        composed_of :personal_information,
                    class_name: "Customer::Model::WithVo::PersonalInformation",
                    mapping: [%w[name name], %w[birthday birthday]]
        validates_with PersonalInformationValidator

        validates_with PhoneSyntaxValidator
        validates :phone, uniqueness: true

        validates_with EmailSyntaxValidator
        validates :email, uniqueness: true

        has_many :rates
      end
    end
  end
end
