module UserTransaction
  class Inquiry
    attr_reader :rut, :date, :client, :account

    def initialize(rut:, date:)
      @rut = rut
      @date = date
    end

    def perform
      @client = User.find_by(rut: rut)

      return { type: :error, message: "Rut incorrecto" }  if @client.nil?

      @account = client.account

      { type: :success, total: get_amount_by_date }
    end

    private

    def get_amount_by_date
      deposit_transactions = account.transactions.not_paper_request.for_date(date: date)
      deposit_total = deposit_transactions.sum { |t| t.quantity }

      request_transactions = account.transactions.paper_request.for_date(date: date)
      request_total = request_transactions.sum { |t| t.quantity }

      deposit_total - request_total
    end

  end
end
