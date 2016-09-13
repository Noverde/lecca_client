module LeccaClient
  module Proposal
    class Operation < Hashie::Dash
      include LeccaClient::Utils

      property :codigo_produto, required: true, default: LeccaClient.config.proposal[:codigo_produto]
      property :data_operacao, required: true
      property :codigo_agencia, required: true, default: LeccaClient.config.proposal[:codigo_agencia]
      property :codigo_rede, required: true, default: LeccaClient.config.proposal[:codigo_rede]
      property :digito_rede, required: true, default: LeccaClient.config.proposal[:digito_rede]
      property :codigo_loja, required: true, default: LeccaClient.config.proposal[:codigo_loja]
      property :digito_loja, required: true, default: LeccaClient.config.proposal[:digito_loja]
      property :nome_loja, required: true, default: LeccaClient.config.proposal[:nome_loja]
      property :numero_operacao, required: true
      property :codigo_tabela_juros, required: true, default: LeccaClient.config.proposal[:codigo_tabela_juros]
      property :taxa_juros, required: true
      property :data_primeira_parcela, required: true
      property :valor_compra, required: true
      property :valor_entrada
      property :valor_cac, require: true
      property :quantidade_parcela, required: true
      property :valor_parcela, required: true
      property :valor_ioc
      property :forma_liberacao, required: true, default: LeccaClient.config.proposal[:forma_liberacao]
      property :forma_liquidacao, required: true, default: LeccaClient.config.proposal[:forma_liquidacao]
      property :digito_agencia_doc
      property :digito_conta_doc
      property :nome_favorecido_doc
      property :praca_doc
      property :banco_doc
      property :agencia_doc
      property :conta_doc
      property :cpf_doc
      property :tac_financiada
      property :valor_doc

      def build
        parts = ''

        parts << justify_string(codigo_produto, 4)
        parts << justify_string(data_operacao, 8)
        parts << justify_string(codigo_agencia, 4)
        parts << justify_string(codigo_rede, 5)
        parts << justify_string(digito_rede, 1)
        parts << justify_string(codigo_loja, 5)
        parts << justify_string(digito_loja, 1)
        parts << justify_string(nome_loja, 35)

        parts << justify_number(numero_operacao, 12)
        parts << justify_number(codigo_tabela_juros, 8)
        parts << justify_value(taxa_juros, 10, 4)

        parts << justify_string(data_primeira_parcela, 8)
        parts << justify_value(valor_compra, 15)
        parts << justify_value(valor_entrada, 15)
        parts << justify_value(valor_principal, 15)
        parts << justify_value(valor_cac, 15)
        parts << justify_number(quantidade_parcela, 3)
        parts << justify_value(valor_parcela, 15)
        parts << justify_value(valor_ioc, 15)

        parts << justify_string(forma_liberacao, 1)
        parts << justify_string(forma_liquidacao, 1)

        parts << justify_string(digito_agencia_doc, 1)
        parts << justify_string(digito_conta_doc, 2)
        parts << justify_string(nome_favorecido_doc, 35)
        parts << justify_number(praca_doc, 3)
        parts << justify_number(banco_doc, 3)
        parts << justify_number(agencia_doc, 4)
        parts << justify_number(conta_doc, 8)
        parts << justify_number(cpf_doc, 14)
        parts << justify_string(tac_financiada, 1)
        parts << justify_value(valor_doc, 15)
      end

      private

      def valor_principal
        valor_compra
      end
    end
  end
end
