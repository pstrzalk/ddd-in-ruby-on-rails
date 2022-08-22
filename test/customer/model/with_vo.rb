module Customer
  module Model
    module WithVo
      class Test
        def self.run # rubocop:disable all
          invalid_customer = Customer.new
          invalid_customer.valid?
          pp invalid_customer.errors

          address = Address.new("Warsaw", "Odolanska")
          personal_information = PersonalInformation.new("Joe Doe", Date.parse("1980-07-15"))
          customer = Customer.create!(
            address: address,
            personal_information: personal_information,
            phone: "+48 112 555 339",
            email: "joedoe@domain.com"
          )

          other_customer = Customer.create!(
            address: Address.new("Krakow", "Wawelska"),
            personal_information: PersonalInformation.new("Jim Bom", Date.parse("1990-02-19")),
            phone: "+48 339 555 112",
            email: "jimbom@domain.com"
          )

          rate = Rate.create!(
            customer: customer,
            rated_customer: other_customer,
            mark: 3
          )

          pp rate
          pp customer
          pp customer.address
          pp customer.personal_information
          pp other_customer

          rate.destroy!
          customer.destroy!
          other_customer.destroy!
        end
      end
    end
  end
end

Customer::Model::WithVo::Test.run
