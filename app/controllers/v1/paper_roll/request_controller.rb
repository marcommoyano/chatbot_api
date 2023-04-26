module V1
  module PaperRoll
    class RequestController < ApplicationController

      # GET /v1/paper_roll/request
      def index        
      end
      
      def search
        @rut = params[:request][:rut]
        @adress = params[:request][:adress]
        @quantity = params[:request][:quantity]
        service = ::PaperRoll::Request.new(rut: @rut, adress: @adress, quantity: @quantity)
        @json_data = service.perform

        if @json_data[:type] == :error
          flash[:danger] = @json_data[:message]
        elsif @json_data[:type] == :success
          flash[:success] = @json_data[:message]
        end
      end

      def to_pdf
        @rut = params[:rut]
        @quantity = params[:quantity]
        transaction_id = params[:transaction_id].to_i
        @transaction = ::Transaction.find(transaction_id)

        respond_to do |format|
          format.pdf { render template: 'v1/paper_roll/request/file.html.erb', pdf: 'Report'}
        end
      end
    end
  end
end
