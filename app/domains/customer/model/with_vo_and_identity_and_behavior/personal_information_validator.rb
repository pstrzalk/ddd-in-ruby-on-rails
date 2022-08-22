module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class PersonalInformationValidator < ActiveModel::Validator
        def validate(record)
          validate_email(record)
          validate_name(record)
          validate_birthday(record)
        end

        private

        def validate_email(record)
          record.errors.add(:email, "Email is blank") if record.personal_information.email.blank?
        end

        def validate_name(record)
          record.errors.add(:name, "Name is blank") if record.personal_information.name.blank?
        end

        def validate_birthday(record)
          if record.personal_information.birthday.blank?
            record.errors.add :birthday, "Birthday is blank"
          elsif record.personal_information.birthday.future?
            record.errors.add :birthday, "is in the future"
          end
        end
      end
    end
  end
end
