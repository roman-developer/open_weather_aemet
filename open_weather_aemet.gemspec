# frozen_string_literal: true

require_relative "lib/open_weather_aemet/version"

Gem::Specification.new do |spec|
  spec.name = "open_weather_aemet"
  spec.version = OpenWeatherAemet::VERSION
  spec.authors = ["Jose Maria Roman"]
  spec.email = ["jose.maria.roman87@gmail.com"]

  spec.summary = "Open Weather Aemet is an open source library to get data from AEMET API."
  spec.description = "Open Weather Aemet access to the AEMET Open Data, a system that provides weather info from the spanish AEMET agency (Agencia Estatal de Meteorología)"
  spec.homepage = "https://github.com/roman-developer/open_weather_aemet"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roman-developer/open_weather_aemet"
  spec.metadata["changelog_uri"] = "https://github.com/roman-developer/open_weather_aemet/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
  #   end
  # end
  spec.files = Dir.glob(File.join("lib", "**", "*")) + Dir.glob(File.join("spec", "**", "*"))

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
