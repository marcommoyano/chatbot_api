module V1
  module Transaction
    class DepositController < ApplicationController

      # GET /v1/transaction/deposit
      def index        
      end
      
      def search
        @rut = params[:transaction][:rut]
        @total = params[:transaction][:total]
        @date = params[:transaction][:date]
        service = ::UserTransaction::Deposit.new(rut: @rut, total: @total, date: @date)
        @json_data = service.perform

        if @json_data[:type] == :error
          flash[:danger] = @json_data[:message]
        elsif @json_data[:type] == :success
          flash[:success] = @json_data[:message]
        end
      end
    end
  end
end
