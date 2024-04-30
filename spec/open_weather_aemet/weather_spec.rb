# frozen_string_literal: true

require "open_weather_aemet"

RSpec.describe OpenWeatherAemet::Weather do
  describe ".forecast_by_api_url" do
    context "with valid API URL and API key" do
      let(:api_url) { "https://api.example.com" }
      let(:api_key) { "API_KEY" }

      it "calls the DataResponse service" do
        expect_any_instance_of(ApiAemet::DataResponse).to receive(:call).and_return("Response data")
        response = described_class.forecast_by_api_url(api_url, api_key)
        expect(response).to eq("Response data")
      end
    end

    context "with invalid inputs" do
      it 'returns "Invalid inputs"' do
        response = described_class.forecast_by_api_url(nil, nil)
        expect(response).to eq("Invalid inputs")
      end
    end
  end

  describe ".forecast_by_city" do
    context "when city_code or API key is not valid for Aemet API" do
      let(:city_code) { 5890 }
      let(:api_key) { "FAKE_API_KEY" }

      it "calls the DataResponse service" do
        expect_any_instance_of(ApiAemet::DataResponse).to receive(:call).and_return("Response data")
        response = described_class.forecast_by_city(city_code, api_key)
        expect(response).to eq("Invalid data")
      end
    end
  end
end
