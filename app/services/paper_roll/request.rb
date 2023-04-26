module PaperRoll
  class Request
    attr_reader :rut, :adress, :quantity, :client, :account, :format_tomorrow

    BASE = 700

    def initialize(rut:, adress:, quantity:)
      @rut = rut
      @adress = adress
      @quantity = quantity
    end

    def perform
      @client = User.find_by(rut: rut)

      return { type: :error, message: "Rut incorrecto" }  if @client.nil?

      @account = client.account
      tomorrow = Time.now + 1.days
      @format_tomorrow = tomorrow.strftime('%Y-%m-%d')
      total_tomorrow = tomorrow_total_deposit

      return { type: :error, message: "Saldo insuficiente para la cantidad de rollos solicitados" } unless valid_transaction?(total_tomorrow)

      ActiveRecord::Base.transaction do
        transaction = create_transaction
        decrement_amount

        { type: :success, message: "Solicitud realizada con éxito", transaction_id: transaction.id }
      end
    end

    private

    def tomorrow_total_deposit
      deposit_transactions = account.transactions.not_paper_request.for_date(date: format_tomorrow)
      deposit_total = deposit_transactions.sum { |t| t.quantity }

      request_transactions = account.transactions.paper_request.for_date(date: format_tomorrow)
      request_total = request_transactions.sum { |t| t.quantity }

      deposit_total - request_total
    end

    def valid_transaction?(total_tomorrow)
      price <= total_tomorrow
    end

    def price
      @price ||= BASE * quantity.to_i
    end

    def create_transaction
      Transaction.create(account_id: account.id, 
                         adress: adress, 
                         quantity: price, 
                         date: format_tomorrow, 
                         is_paper_request: true)
    end

    def decrement_amount
      account.amount -= price
      account.save!
    end
  end
end
