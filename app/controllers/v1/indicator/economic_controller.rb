module V1
  module Indicator
    class EconomicController < ApplicationController

      # GET /v1/indicator/economic
      def index        
      end

      def search
        @date = params[:indicators][:date]
        service = ::Indicator::Economic.new(date: @date)
        @json_data = service.perform
      end
    end
  end
end
