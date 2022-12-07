module CarCatalog
  class CarRepositoryTest
    def self.run # rubocop:disable all
      car = Domain::Car.new(registration_number: "DDD 2013", color: "red")
      puts "Domain car: #{car}"

      repository = Infrastructure::DbCarRepository.new
      repository.save(car)
      puts "Persisted..."

      car = repository.of_registration_number("FOO 2033")
      puts "Car of registration number FOO 2033: #{car}"

      car = repository.of_registration_number("DDD 2013")
      puts "Car of registration number DDD 2033: #{car}"

      car.repaint_to("purple")
      puts "Domain car with new paint: #{car}"

      repository.save(car)
      puts "Persisted..."

      car = repository.of_registration_number("DDD 2013")
      puts "Car of registration number DDD 2033: #{car}"

      car = Domain::Car.new(registration_number: "DDD 2014", color: "blue")
      puts "Domain car: #{car}"
      repository.save(car)
      puts "Persisted..."

      car = Domain::Car.new(registration_number: "WWW 2015", color: "silver")
      puts "Domain car: #{car}"
      repository.save(car)
      puts "Persisted..."

      cars = repository.registered_in_ddd
      puts "Car registered in DDD:"
      puts cars.map(&:to_s).join("\n")
    end
  end
end

CarCatalog::CarRepositoryTest.run
