module Customer
  module Model
    module WithVoAndIdentityAndBehavior
      class PersonalInformation
        attr_reader :name, :birthday, :email

        def initialize(name, birthday, email)
          @name = name
          @birthday = birthday
          @email = email
        end
      end
    end
  end
end
