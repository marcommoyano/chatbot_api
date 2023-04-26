module UserTransaction
  class Deposit
    attr_reader :rut, :total, :date, :client, :account

    def initialize(rut:, total:, date:)
      @rut = rut
      @total = total
      @date = date
    end

    def perform
      @client = User.find_by(rut: rut)

      return { type: :error, message: "Rut incorrecto" }  if @client.nil?

      @account = client.account

      ActiveRecord::Base.transaction do
        create_transaction
        increment_amount

        { type: :success, message: "Deposito realizado correctamente" }
      end
    end

    private

    def create_transaction
      Transaction.create(account_id: account.id, quantity: total, date: date, is_paper_request: false)
    end

    def increment_amount
      account.amount += total.to_f
      account.save!
    end
  end
end
