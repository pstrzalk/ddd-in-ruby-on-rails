module Analytics
  class Client
    def self.track(params)
      # sent event outside and return
      Rails.logger.info("[Analytics::Client] Tracking #{params}")

      true
    end
  end
end
