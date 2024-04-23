# frozen_string_literal: true

require_relative "open_weather_aemet/version"

module OpenWeatherAemet
  class Error < StandardError; end
  
  class Weather
    def self.hi
      puts "Hello world!"
    end
  end
end
