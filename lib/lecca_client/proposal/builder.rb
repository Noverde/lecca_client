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

      def create
        [operacao, cliente, endereco, telefone, emprego, conta_bancaria].map(&:build).reduce(:+)
      end
    end
  end
end
