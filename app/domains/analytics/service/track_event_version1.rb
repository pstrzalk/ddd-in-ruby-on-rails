# Usage example
# TrackEventVersion1.new(user_id: 6, event: 'Item added').call

module Analytics
  module Service
    class TrackEventVersion1
      def initialize(user_id:, event:)
        self.user_id = user_id
        self.event = event
      end

      def call
        return false unless Configuration.enabled?

        Client.track(
          user_id: user_id,
          event: event,
          properties: properties
        )
      end

      private

      attr_accessor :user_id, :event

      def properties
        {
          foo: :bar,
          moo: :too
        }
      end
    end
  end
end
