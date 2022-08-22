module Customer
  module Model
    module OrmDriven
      class EmailSyntaxValidator < ActiveModel::Validator
        def validate(record)
          return if record.email.present? && record.email.include?("@")

          record.errors.add :email, "Email is invalid"
        end
      end
    end
  end
end
