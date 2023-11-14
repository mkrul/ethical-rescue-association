require 'uri'
require 'net/http'

module Utils
  class ActiveErrorOccurrances < ActiveInteraction::Base
    PROJECT_ACCESS_TOKEN = '72dc737826494da9aad8b1cc5e4d9204'

    def execute
      url = URI('https://api.rollbar.com/api/1/reports/occurrence_counts?min_level=error&bucket_size=86400')
      headers = {
        'X-Rollbar-Access-Token' => PROJECT_ACCESS_TOKEN
      }

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url, headers)

      response = http.request(request)

      JSON.parse(response.read_body)["err"]
    end
  end
end
