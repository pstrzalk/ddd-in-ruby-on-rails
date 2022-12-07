module CarCatalog
  module Infrastructure
    class DbCarRepository
      def of_registration_number(registration_number)
        db_car = DbCar.find_by(registration_number: registration_number)
        return unless db_car

        to_domain_car(db_car)
      end

      def save(car)
        db_car = car.id ? DbCar.find(car.id) : DbCar.new
        db_car.assign_attributes(
          registration_number: car.registration_number,
          color: car.color
        )

        db_car.save!
      end

      def registered_in_ddd
        db_cars = DbCar.where('registration_number LIKE "DDD%"')
        db_cars.map { |db_car| to_domain_car(db_car) }
      end

      private

      def to_domain_car(db_car)
        car = Domain::Car.new(
          registration_number: db_car[:registration_number],
          color: db_car[:color]
        )
        car.send("id=", db_car[:id])
        car
      end
    end
  end
end
