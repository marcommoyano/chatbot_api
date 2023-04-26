module Indicator
  class Economic
    attr_reader :date

    BASE_URI = 'https://mindicador.cl/api'
    INDICATORS = ['dolar', 'uf', 'utm']

    def initialize(date:)
      @date = date
    end

    def perform
      get_data(date, 'dolar')
    end

    private

    def get_data(date, type)
      format_date = date.split('-')
      values = {}

      INDICATORS.each do |type|
        indicator_data = RestClient.get("#{BASE_URI}/#{type}/#{format_date[2]}-#{format_date[1]}-#{format_date[0]}")
        values[type] = JSON.parse(indicator_data)["serie"].first.try(:[], "valor")
      end
      
      values
    end
    
  end
end
