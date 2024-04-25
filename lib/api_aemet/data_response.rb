# frozen_string_literal: true
require 'uri'
require 'net/http'
require "api_aemet/connector"
require 'json'

module ApiAemet
  class DataResponse
    def initialize(api_url:, api_key:)
      @api_url = api_url
      @api_key = api_key
    end

    def call
      aemet_response = ApiAemet::Connector.new(api_url: api_url, api_key: api_key).call
      data = JSON.parse(aemet_response.read_body)
      resource_url = data['datos']

      return {} unless resource_url
  
      response = Net::HTTP.get(URI(resource_url))
      JSON.parse(response)
    end

    private 

    attr_reader :api_url, :api_key
  end
end
