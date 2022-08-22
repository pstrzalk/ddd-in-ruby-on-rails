module Customer
  module Model
    module WithPersonModel
      class Address
        attr_reader :city, :street

        def initialize(city, street)
          @city = city
          @street = street
        end
      end
    end
  end
end
