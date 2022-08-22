module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class AddressValidator < ActiveModel::Validator
        def validate(record)
          record.errors.add(:city, "City is blank") if record.address.city.blank?
          record.errors.add(:street, "Street is blank") if record.address.street.blank?
        end
      end
    end
  end
end
