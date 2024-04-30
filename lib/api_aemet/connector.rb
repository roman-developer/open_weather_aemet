# frozen_string_literal: true

require "uri"
require "net/http"

module ApiAemet
  class Connector
    # api_url: API url from AEMET OpenData (source: https://opendata.aemet.es/dist/index.html)
    # api_key: get a valid key from AEMET OpenData (source: https://opendata.aemet.es/centrodedescargas/altaUsuario?)

    def initialize(api_url:, api_key:)
      @api_url = api_url
      @api_key = api_key
    end

    def call
      url = URI("#{api_url}/?api_key=#{api_key}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["cache-control"] = "no-cache"

      http.request(request)
    end

    private

    attr_reader :api_url, :api_key
  end
end
