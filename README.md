# OpenWeatherAemet

**OpenWeatherAemet** is a Ruby gem implemented to access to the [Aemet Open Data](https://opendata.aemet.es/centrodedescargas/inicio).

The AEMET (es: *Agencia Estatal de Meteorología*) provides some open resources in API format to get meterologic information, like the weather forecasting for Spain teritories.

![AEMET](https://i.ibb.co/t3mhrhH/quienes-somos.gif[/img])

This API is accesible via AEMET [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?), and you could get which endpoints to use in this [swagger](https://opendata.aemet.es/dist/index.html?) documentation. So, you need to create an API key in the AEMET web page before starting to use this gem in your project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_weather_aemet'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install open_weather_aemet

## Usage

Previous requirements:

- Get an [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?) from AEMET (we would recommend to store in an ENV variable for your project).

If you have installed (see prev section) the gem in your ruby project:

1. Require the library:
    
    ```ruby
    require 'open_weather_aemet'
    ```
    
2. Use some of the following methods
    
    ```ruby
    # Get forecast results from any endpoint.
    # api_url is the endpoint URL
    # api_key is the AEMET api key
    OpenWeatherAemet::Weather.forecast_by_api_url(api_url, api_key)
    
    # Get forecast results from a city.
    # city_code is the official INE code from any spanish city
    # api_key is the AEMET api key
    OpenWeatherAemet::Weather.forecast_by_city(city_code, api_key)
    ```

    You can get INE codes from the [web INE](https://www.ine.es/daco/daco42/codmun/codmun11/11codmunmapa.htm). In the future, we will try to implement a method by city name instead of city code.

    
3. Use the JSON returned as you want. Example of output for *forecast by city*:
```
[{:date=>"2024-04-29T00:00:00", :max_temperature=>18, :min_temperature=>6, :sky_state=>"very_cloudy"},
 {:date=>"2024-04-30T00:00:00", :max_temperature=>21, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals"},
 {:date=>"2024-05-01T00:00:00", :max_temperature=>16, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals_with_rain"}]
```

## Contributing

Bug reports and pull requests are welcome to be opened in this repo https://github.com/roman-developer/open_weather_aemet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the **OpenWeatherAemet** project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).
