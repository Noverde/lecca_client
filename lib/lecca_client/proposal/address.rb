module LeccaClient
  module Proposal
    class Address < Hashie::Dash
      property :codigo_produto, required: true
      property :data_operacao
      property :codigo_agencia
      property :codigo_rede
      property :digito_rede
      property :codigo_loja
      property :digito_loja
      property :nome_loja
      property :numero_operacao
      property :codigo_tabelo_juros
      property :taxa_juros
      property :data_primeira_parcela
      property :valor_compra
      property :valor_entrada
      property :valor_principal
      property :valor_cac
      property :quantidade_parcela
      property :valor_parcela
      property :valor_ioc
      property :forma_liberacao
      property :forma_liquidacao
      property :digito_agencia
      property :digito_conta
      property :nome_favorecido
      property :praca_doc
      property :banco

      def build
        '1'
      end
    end
  end
end
