# OpenWeatherAemet

**OpenWeatherAemet** is a Ruby gem implemented to access to the [Aemet Open Data](https://opendata.aemet.es/centrodedescargas/inicio).

The AEMET (es: *Agencia Estatal de Meteorología*) provides some open resources in API format to get meterologic information, like the weather forecasting for Spain teritories.

![AEMET](https://i.ibb.co/t3mhrhH/quienes-somos.gif[/img])

This API is accesible via AEMET [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?), and you could get which endpoints to use in this [swagger](https://opendata.aemet.es/dist/index.html?) documentation. So, you need to create an API key in the AEMET web page before starting to use this gem in your project.

:es: --> *Este README está disponible en Español [aquí](https://github.com/roman-developer/open_weather_aemet/blob/main/README_ES.md)*

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

:exclamation: Previous requirements:

- Get an [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?) from AEMET (we would recommend to store in an ENV variable for your project).

If you have installed the gem (see [previous section](##Installation)) in your ruby project:

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

    :round_pushpin: You can get **INE codes** from the [INE website](https://www.ine.es/daco/daco42/codmun/codmun11/11codmunmapa.htm). In the future, we will try to implement a method by city name instead of city code.

    
3. Use the JSON returned as you want. Example of output for *forecast by city*:
```
[{:date=>"2024-04-29T00:00:00", :max_temperature=>18, :min_temperature=>6, :sky_state=>"very_cloudy"},
 {:date=>"2024-04-30T00:00:00", :max_temperature=>21, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals"},
 {:date=>"2024-05-01T00:00:00", :max_temperature=>16, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals_with_rain"}]
```

## Contributing

Any contribution to improve this gem is welcome in this repo https://github.com/roman-developer/open_weather_aemet. If you want to collaborate, adding a new implementation or fixing a bug, please open an issue and a PR associate to this issue to be reviewed by the repository owners.

Follow these **rules** when you add your code:

- Start commit name with `chore:` if you are doing a maintenance task.
- Start commit name with `feat:` if you are implementing a new feature (if is not existing in the project).
- Start commit name with `doc:` if you are adding documentation
- Start commit name with `bug:` if you are fixing a bug.

:warning: DON'T try to merge directly on `main` branch, please open a PR for contributing, if not your code could be reverted.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the **OpenWeatherAemet** project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).
