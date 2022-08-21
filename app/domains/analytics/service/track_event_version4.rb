# Usage example
# TrackEventVersion4.new(user_id: 6, event: Analytics::Model::Event.combination_of(noun: "Jon", verb: "Created"))
# TrackEventVersion4.new(user_id: 6, event: Analytics::Model::Event.new(name: "Cloned and archived related clients"))

module Analytics
  module Service
    class TrackEventVersion4
      def initialize(user_id:, event: nil)
        self.user_id = user_id
        self.event = event.name
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
