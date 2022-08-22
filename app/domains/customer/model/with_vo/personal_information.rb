module Customer
  module Model
    module WithVo
      class PersonalInformation
        attr_reader :name, :birthday

        def initialize(name, birthday)
          @name = name
          @birthday = birthday
        end
      end
    end
  end
end
