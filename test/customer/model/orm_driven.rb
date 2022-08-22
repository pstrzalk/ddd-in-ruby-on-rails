module Customer
  module Model
    module OrmDriven
      class Test
        def self.run # rubocop:disable all
          invalid_customer = Customer.new
          invalid_customer.valid?
          pp invalid_customer.errors

          customer = Customer.create!(
            city: "Warsaw",
            street: "Odolanska",
            name: "Joe Doe",
            birthday: Date.parse("1980-07-15"),
            phone: "+48 112 555 339",
            email: "joedoe@domain.com"
          )

          other_customer = Customer.create!(
            city: "Krakow",
            street: "Wawelska",
            name: "Jim Bom",
            birthday: Date.parse("1990-02-19"),
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
          pp other_customer

          rate.destroy!
          customer.destroy!
          other_customer.destroy!
        end
      end
    end
  end
end

Customer::Model::OrmDriven::Test.run
