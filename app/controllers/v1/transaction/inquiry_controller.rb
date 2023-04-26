module V1
  module Transaction
    class InquiryController < ApplicationController

      # GET /v1/transaction/inquiry
      def index        
      end
      
      def search
        @rut = params[:transaction][:rut]
        @date = params[:transaction][:date]
        service = ::UserTransaction::Inquiry.new(rut: @rut, date: @date)
        @json_data = service.perform

        if @json_data[:type] == :error
          flash[:danger] = @jsonn_data[:message]
        end
      end
    end
  end
end
