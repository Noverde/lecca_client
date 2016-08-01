module LeccaClient
  module Proposal
    class Builder < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion

      property :operacao, coerce: Operation, required: true
      property :cliente, coerce: Customer, required: true
      property :endereco, coerce: Address, required: true
      property :telefone, coerce: Phone, required: true
      property :emprego, coerce: Job, required: true
      property :conta_bancaria, coerce: BankAccount , required: true

      def line
        [operacao, cliente, endereco, telefone, emprego, conta_bancaria].map(&:build).reduce(:+)
      end

      def upload
        LeccaClient::Uploader.new(line, filename).upload
      end

      private

      def filename
        file = operacao[:numero_operacao]

        "#{file}.txt"
      end
    end
  end
end
