module Customer
  module Model
    module OrmDriven
      class PhoneSyntaxValidator < ActiveModel::Validator
        def validate(record)
          return if record.phone.present? && record.phone.start_with?("+")

          record.errors.add :phone, "Phone is invalid"
        end
      end
    end
  end
end
