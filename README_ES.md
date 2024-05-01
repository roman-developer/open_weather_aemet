# OpenWeatherAemet

**OpenWeatherAemet** es un a gema de Ruby implementada para acceder al sistema [Aemet Open Data](https://opendata.aemet.es/centrodedescargas/inicio).

La AEMET (*Agencia Estatal de Meteorología*) tiene a disposición una API de libre acceso donde muestra información meteorológica, como la predicción del tiempo para los territorios españoles.

![AEMET](https://i.ibb.co/t3mhrhH/quienes-somos.gif[/img])

Esta API es accesible a través de una [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?) de la AEMET, y puedes acceder a cualquiera de ellos a través de la documentación [swagger](https://opendata.aemet.es/dist/index.html?). Por lo que necesitas crear una clave para la API de Aemet si quieres usar esta gema en tu proyecto.

## Instalación

Añade esta línea a tu Gemfile:

```ruby
gem 'open_weather_aemet'
```

Ejecuta:

    $ bundle install

O instálala por tu cuenta a través del comando:

    $ gem install open_weather_aemet

## Uso

:exclamation: Requisitos previos:

- Obtener un [API key](https://opendata.aemet.es/centrodedescargas/altaUsuario?) de la web de AEMET (te recomendamos almacenarla en una variable de entorno en tu proyecto).

Si has instalado la gema en tu proyecto, entonces:

1. Accede a la librería:
    
    ```ruby
    require 'open_weather_aemet'
    ```
    
2. Usa alguno de los siguientes métodos
    
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

    :round_pushpin: Puedes obtener tu código INE desde la [web INE](https://www.ine.es/daco/daco42/codmun/codmun11/11codmunmapa.htm). En el futuro intentaremos implementar un método que use directamente el nombre de la ciudad.

    
3. Usa la salida del JSON generado como quieras. Un ejemplo para *forecast by city*:
```
[{:date=>"2024-04-29T00:00:00", :max_temperature=>18, :min_temperature=>6, :sky_state=>"very_cloudy"},
 {:date=>"2024-04-30T00:00:00", :max_temperature=>21, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals"},
 {:date=>"2024-05-01T00:00:00", :max_temperature=>16, :min_temperature=>4, :sky_state=>"partly_cloudy_intervals_with_rain"}]
```

## Contribución

Cualquier contribución para mejorar el código de la gema es bienvenida en este repositorio https://github.com/roman-developer/open_weather_aemet. Si quieres colaborar, añadiendo una nueva implementación o resolviendo un error, por favor, abre un issue y un Pull Request asociado al issue para que los propietarios del repositorio puedan revisarlo. 

Sigue estas **reglas** cuando añadas tu código (y hazlo siempre en inglés):

- Comienza el nombre de tu commit con `chore:` si estás haciendo una tarea de mantenimiento.
- Comienza el nombre de tu commit con  `feat:` si estás implementando una nueva funcionalidad (no existente en el proyecto).
- Comienza el nombre de tu commit con  `doc:` si añades documentación (la documentación debe ser escrita en inglés)
- Comienza el nombre de tu commit con  `bug:` si pretendes resolver un bug.

:warning: NO intentes fusionar o llevar tus cambios directamente a la rama `main`, abre un PR para contribuir, sino tus cambios pueden ser revertidos.

Este proyecto pretende ser un lugar seguro, donde todos son bienvenidos a colaborar, por lo que si contribuyes debes aceptar el [código de conducta](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).


## Licencia

Esta gema esta bajo licencia [MIT](https://opensource.org/licenses/MIT).

## Código de conducta

Cualquier interacción con **OpenWeatherAemet** debe respetar el [código de conducta](https://github.com/[USERNAME]/open_weather_aemet/blob/main/CODE_OF_CONDUCT.md).
