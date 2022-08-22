module Analytics
  module Service
    class Test
      def self.run # rubocop:disable all
        service = TrackEventVersion1.new(user_id: 6, event: "Item added")
        result = service.call
        pp "TrackEventVersion1 result: #{result}"

        service = TrackEventVersion2.new(user_id: 6, noun: "Job", verb: "Done")
        result = service.call
        pp "TrackEventVersion2 result: #{result}"

        service = TrackEventVersion3.new(user_id: 6, noun: "Job", verb: "Done")
        result = service.call
        pp "TrackEventVersion3 using noun+verb result: #{result}"

        service = TrackEventVersion3.new(user_id: 6, event: "Thing Done Well")
        result = service.call
        pp "TrackEventVersion3 using noun+verb result: #{result}"

        event = Analytics::Model::Event.combination_of(noun: "Jon", verb: "Created")
        service = TrackEventVersion4.new(user_id: 6, event: event)
        result = service.call
        pp "TrackEventVersion4 using event built using noun+verb: #{result}"

        event = Analytics::Model::Event.new(name: "Cloned and archived related clients")
        service = TrackEventVersion4.new(user_id: 6, event: event)
        result = service.call
        pp "TrackEventVersion4 using event built using name: #{result}"
      end
    end
  end
end

Analytics::Service::Test.run
