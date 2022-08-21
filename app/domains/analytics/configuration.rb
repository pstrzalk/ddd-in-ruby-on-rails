module Analytics
  class Configuration
    def self.enabled?
      ENV.fetch("ANALYTICS_ENABLED", "0") == "1"
    end
  end
end
