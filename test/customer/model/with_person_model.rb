module Customer
  module Model
    module WithPersonModel
      class Test
        def self.run # rubocop:disable all
          invalid_customer = Customer.new
          invalid_customer.valid?
          pp invalid_customer.errors

          address = Address.new("Warsaw", "Odolanska")
          person = Person.create!(
            name: "Bo Mo",
            email: "bomo@domain.com",
            birthday: Date.parse("1990-02-19")
          )
          customer = Customer.create!(
            address: address,
            person: person,
            phone: "+48 112 555 339"
          )

          other_person = Person.create!(
            name: "Po Ro",
            email: "poro@domain.com",
            birthday: Date.parse("1975-11-20")
          )
          other_customer = Customer.create!(
            address: Address.new("Krakow", "Wawelska"),
            person: other_person,
            phone: "+48 339 555 112"
          )

          Rate.create!(
            customer: customer,
            rated_customer: other_customer,
            mark: 3
          )

          pp customer
          pp customer.person
          pp customer.address
          pp customer.rates

          pp other_customer
          pp other_customer.person
          pp other_customer.address
          pp other_customer.rates

          customer.rates.destroy_all
          customer.destroy!
          other_customer.destroy!
        end
      end
    end
  end
end

Customer::Model::WithPersonModel::Test.run
