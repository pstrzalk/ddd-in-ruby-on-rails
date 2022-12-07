module CarCatalog
  module Infrastructure
    class DbCar < ApplicationRecord
      self.table_name = "car_catalog_cars"
    end
  end
end
