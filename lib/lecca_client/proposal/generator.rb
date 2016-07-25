module LeccaClient
  module Proposal
    class Generator < Hashie::Dash
      include Hashie::Extensions::Dash::Coercion

      property :operacao, coerce: Operation, required: true
      property :cliente, coerce: Customer, required: true
      property :endereco, coerce: Address, required: true
      property :telefone, coerce: Phone, required: true

      def create
        [operacao, cliente, endereco, telefone].map(&:build).reduce(:+)
      end
    end
  end
end
