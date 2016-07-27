module LeccaClient
  module Proposal
    class Address < Hashie::Dash
      include LeccaClient::Utils

      property :endereco, required: true
      property :numero, required: true
      property :complemento
      property :uf, required: true
      property :bairro, required: true
      property :cidade, required: true
      property :pais, required: true
      property :cep, required: true

      def build
        parts = ''

        parts << justify_number(tipo_residencia, 1)
        parts << justify_string(endereco, 60)
        parts << justify_number(numero, 5)
        parts << justify_string(complemento, 30)
        parts << justify_string(uf, 2)
        parts << justify_string(bairro, 30)
        parts << justify_string(cidade, 40)
        parts << justify_number(pais, 5)
        parts << justify_string(cep, 8)
      end

      private

      def tipo_residencia
        1 # fixed value from Lecca docs
      end

      def pais
        1 # fixed value from Lecca docs
      end
    end
  end
end
