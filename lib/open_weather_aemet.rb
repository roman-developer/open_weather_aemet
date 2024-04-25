# frozen_string_literal: true

require_relative "open_weather_aemet/version"
require "api_aemet/data_response"

module OpenWeatherAemet
  class Error < StandardError; end
  
  class Weather
    def self.forecast_by_api_url(api_url, api_key)
      return 'Invalid inputs' unless api_url || api_key

      ApiAemet::DataResponse.new(api_url: api_url, api_key: api_key).call
    end
  end
end
