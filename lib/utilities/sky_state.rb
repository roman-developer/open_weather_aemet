module Utilities
  class SkyState
    attr_reader :state

    DEFAULT_SKY_STATE = 11 # 11 is the value for no clouds

    def initialize(state)
      @state = state
    end

    def format_state
      state_00_24 = state.find { |item| item["periodo"] == "00-24" }
      state_00_12 = state.find { |item| item["periodo"] == "00-12" }
      state_12_24 = state.find { |item| item["periodo"] == "12-24" }

      return state_00_24["value"] unless state_00_24["value"]&.strip&.empty?
      return state_00_12["value"] unless state_00_12["value"]&.strip&.empty?
      return state_12_24["value"] unless state_12_24["value"]&.strip&.empty?
      return DEFAULT_SKY_STATE
    end

    def find
      result = list_sky_states.find { |key, val| key == format_state.to_s }&.last
      result.nil? ? "not_found" : result
    end

    private

    def list_sky_states
      {
        "11" => "clear",
        "11n" => "clear_night",
        "12" => "partly_cloudy",
        "12n" => "partly_cloudy_night",
        "13" => "partly_cloudy_intervals",
        "13n" => "partly_cloudy_intervals_night",
        "14" => "cloudy",
        "14n" => "cloudy_night",
        "15" => "very_cloudy",
        "16" => "overcast",
        "17" => "high_clouds",
        "17n" => "high_clouds_night",
        "43" => "partly_cloudy_intervals_with_light_rain",
        "43n" => "partly_cloudy_intervals_with_light_rain_night",
        "44" => "cloudy_with_light_rain",
        "44n" => "cloudy_with_light_rain_night",
        "45" => "very_cloudy_with_light_rain",
        "46" => "overcast_with_light_rain",
        "23" => "partly_cloudy_intervals_with_rain",
        "23n" => "partly_cloudy_intervals_with_rain_night",
        "24" => "cloudy_with_rain",
        "24n" => "cloudy_with_rain_night",
        "25" => "very_cloudy_with_rain",
        "26" => "overcast_with_rain",
        "71" => "partly_cloudy_intervals_with_light_snow",
        "71n" => "partly_cloudy_intervals_with_light_snow_night",
        "72" => "cloudy_with_light_snow",
        "72n" => "cloudy_with_light_snow_night",
        "73" => "very_cloudy_with_light_snow",
        "74" => "overcast_with_light_snow",
        "33" => "partly_cloudy_intervals_with_snow",
        "33n" => "partly_cloudy_intervals_with_snow_night",
        "34" => "cloudy_with_snow",
        "34n" => "cloudy_with_snow_night",
        "35" => "very_cloudy_with_snow",
        "36" => "overcast_with_snow",
        "51" => "partly_cloudy_intervals_with_thunderstorm",
        "51n" => "partly_cloudy_intervals_with_thunderstorm_night",
        "52" => "cloudy_with_thunderstorm",
        "52n" => "cloudy_with_thunderstorm_night",
        "53" => "very_cloudy_with_thunderstorm",
        "54" => "overcast_with_thunderstorm",
        "61" => "partly_cloudy_intervals_with_thunderstorm_and_light_rain",
        "61n" => "partly_cloudy_intervals_with_thunderstorm_and_light_rain_night",
        "62" => "cloudy_with_thunderstorm_and_light_rain",
        "62n" => "cloudy_with_thunderstorm_and_light_rain_night",
        "63" => "very_cloudy_with_thunderstorm_and_light_rain",
        "64" => "overcast_with_thunderstorm_and_light_rain",
        "81" => "fog",
        "82" => "mist",
        "83" => "haze"
      }
    end
  end
end