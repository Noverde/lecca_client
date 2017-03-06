module LeccaClient
  module Proposal
    class Fund < Hashie::Dash
      include LeccaClient::Utils

      property :rating
      property :cnpj_conveniada, default: 0
      property :cnpj_fundo, default: 0
      property :nome_fundo, default: ''
      property :banco, default: 0
      property :agencia, default: ''
      property :conta_corrente, default: ''

      def build
        parts = ''

        parts << justify_string(rating, 2)
        parts << justify_number(cnpj_conveniada, 14)
        parts << justify_number(cnpj_fundo, 14)
        parts << justify_string(nome_fundo, 40)
        parts << justify_number(banco, 3)
        parts << justify_string(agencia, 4)
        parts << justify_string(conta_corrente, 8)
      end
    end
  end
end
