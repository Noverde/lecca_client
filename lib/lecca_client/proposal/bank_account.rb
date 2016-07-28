module LeccaClient
  module Proposal
    class BankAccount < Hashie::Dash
      include LeccaClient::Utils

      PRODUTO_CREDITO_PESSOAL = 'CP'

      property :digito_agencia, required: -> { credito_pessoal? }
      property :digito_conta, required: -> { credito_pessoal? }
      property :nome_agencia
      property :nome_favorecido, required: -> { credito_pessoal? }
      property :numero_telefone
      property :banco, required: -> { credito_pessoal? }
      property :agencia, required: -> { credito_pessoal? }
      property :conta, required: -> { credito_pessoal? }
      property :tipo_conta, required: -> { credito_pessoal? }, default: '001'
      property :data_abertura

      def build
        parts = ''

        parts << justify_string(digito_agencia, 1)
        parts << justify_string(digito_conta, 2)
        parts << justify_string(nome_agencia, 20)

        parts << justify_string(flag_titularidade, 1)
        parts << justify_string(nome_favorecido, 35)
        parts << justify_number(numero_telefone, 12)

        parts << justify_number(praca, 3)
        parts << justify_number(banco, 3)
        parts << justify_number(agencia, 4)
        parts << justify_number(conta, 8)
        parts << justify_number(tipo_conta, 3)
        parts << justify_number(tipo_documento_cpf, 3)
        parts << justify_number(data_abertura, 8)
        parts << justify_number(codigo_natureza_residencia, 1)
      end

      private

      def praca
        1 # provided by Lecca
      end

      def flag_titularidade
        1 # provided by Lecca
      end

      def tipo_documento_cpf
        1 # provided by Lecca
      end

      def codigo_natureza_residencia
        0 # provided by Lecca
      end

      def credito_pessoal?
        LeccaClient.config.proposal[:codigo_produto] == PRODUTO_CREDITO_PESSOAL
      end
    end
  end
end
