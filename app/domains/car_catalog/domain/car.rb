module CarCatalog
  module Domain
    class Car
      attr_reader :registration_number, :color, :id

      def initialize(registration_number:, color:)
        @registration_number = registration_number
        @color = color
      end

      def repaint_to(new_color)
        @color = new_color
      end

      def to_s
        "I am a #{color} car. My registration_number is #{registration_number} and my ID is #{id.presence || 'nil'}"
      end

      private

      attr_writer :id
    end
  end
end
