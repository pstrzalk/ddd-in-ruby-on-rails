# Usage example
# TrackEventVersion3.new(user_id: 6, noun: 'Job', verb: 'Created').call
# TrackEventVersion3.new(user_id: 6, event: 'Cloned and archived related clients').call

module Analytics
  module Service
    class TrackEventVersion3
      def initialize(user_id:, noun: nil, verb: nil, event: nil)
        self.user_id = user_id
        self.event = event.presence || "#{noun} #{verb}"
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
