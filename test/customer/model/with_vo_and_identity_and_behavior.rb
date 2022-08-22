module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class Test
        def self.run # rubocop:disable all
          invalid_customer = Customer.new
          invalid_customer.valid?
          pp invalid_customer.errors

          address = Address.new("Warsaw", "Odolanska")
          personal_information = PersonalInformation.new("Joe Doe", Date.parse("1980-07-15"), "joedoe@domain.com")
          customer = Customer.create!(
            address: address,
            personal_information: personal_information,
            phone: "+48 112 555 339"
          )

          other_customer = Customer.create!(
            address: Address.new("Krakow", "Wawelska"),
            personal_information: PersonalInformation.new("Jim Bom", Date.parse("1990-02-19"), "jimbom@domain.com"),
            phone: "+48 339 555 112"
          )

          pp customer
          pp customer.address
          pp customer.personal_information

          customer.give_positive_rate(other_customer)
          customer.save!

          pp customer.rates

          begin
            customer.give_positive_rate(customer)
          rescue Customer::CannotRateSelf => e
            pp "rescued from #{e} when giving a positive rate to self"
          end

          begin
            customer.give_negative_rate(other_customer)
          rescue Customer::AlreadyRated => e
            pp "rescued from #{e} when giving duplicated rate"
          end

          pp other_customer

          customer.rates.destroy_all
          customer.destroy!
          other_customer.destroy!
        end
      end
    end
  end
end

Customer::Model::WithVoAndIdentityAndBehavior::Test.run
