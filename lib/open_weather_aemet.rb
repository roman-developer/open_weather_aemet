# frozen_string_literal: true

require_relative "open_weather_aemet/version"
require "api_aemet/data_response"
require "utilities/sky_state"

module OpenWeatherAemet
  class Error < StandardError; end

  class Weather
    def self.forecast_by_api_url(api_url, api_key)
      return "Invalid inputs" unless api_url || api_key

      ApiAemet::DataResponse.new(api_url: api_url, api_key: api_key).call
    end

    def self.forecast_by_city(city_code, api_key)
      api_url = "https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/#{city_code}"
      response = ApiAemet::DataResponse.new(api_url: api_url, api_key: api_key).call

      return "Invalid data" unless response.is_a?(Array)

      three_forecast_days = response.first["prediccion"]["dia"][0..2]
      forecast_result = []
      three_forecast_days.each do |forecast_day|
        forecast_result << {
          date: forecast_day["fecha"],
          max_temperature: forecast_day["temperatura"]["maxima"],
          min_temperature: forecast_day["temperatura"]["minima"],
          sky_state: Utilities::SkyState.new(forecast_day["estadoCielo"]).find
        }
      end

      forecast_result
    end
  end
end
