module Analytics
  module Model
    class Event
      attr_reader :name

      def initialize(name:)
        @name = name.to_s
      end

      def self.combination_of(noun:, verb:)
        new(name: "#{noun} #{verb}")
      end

      def ==(other)
        name == other.name
      end

      def hash
        name.hash
      end
    end
  end
end
