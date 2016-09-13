module LeccaClient
  module Proposal
    class Phone < Hashie::Dash
      include LeccaClient::Utils

      property :ddd_telefone, required: true
      property :telefone, required: true
      property :celular
      property :email
      property :ddd_celular

      def build
        parts = ''

        parts << justify_string(ddd_telefone, 4)
        parts << justify_number(telefone, 12)
        parts << justify_number(celular, 12)
        parts << justify_string(email, 50)
        parts << justify_string(ddd_celular, 4)
      end
    end
  end
end
