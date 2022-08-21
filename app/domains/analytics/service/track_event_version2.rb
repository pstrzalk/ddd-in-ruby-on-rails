# Usage example
# TrackEventVersion2.new(user_id: 6, noun: 'Job', verb: 'Created').call

module Analytics
  module Service
    class TrackEventVersion2
      def initialize(user_id:, noun:, verb:)
        self.user_id = user_id
        self.event = "#{noun} #{verb}"
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
