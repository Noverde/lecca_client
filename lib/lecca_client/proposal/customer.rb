module LeccaClient
  module Proposal
    class Customer < Hashie::Dash
      include LeccaClient::Utils

      property :nome, required: true
      property :estado_civil
      property :sexo
      property :numero_rg, required: true
      property :uf_rg
      property :uf_naturalidade
      property :naturalidade
      property :nome_pai
      property :nome_mae, required: true
      property :orgao_emissor_rg
      property :sigla_uf_outros_documentos
      property :descricao_profissao
      property :descricao_cargo, required: true
      property :cpf, required: true
      property :data_nascimento, required: true
      property :codigo_profissao, required: true
      property :valor_salario_liquido, required: true
      property :data_expedicao_rg
      property :observacao, required: true, default: ''

      def build
        parts = ''

        parts << justify_string(nome, 60)
        parts << justify_number(nacionalidade, 5)
        parts << justify_string(estado_civil, 1)
        parts << justify_string(sexo, 1)

        parts << justify_string(numero_rg, 16)
        parts << justify_string(uf_rg, 2)
        parts << justify_string(uf_naturalidade, 2)
        parts << justify_string(naturalidade, 35)
        parts << justify_string(nome_pai, 35)
        parts << justify_string(nome_mae, 35)
        parts << justify_string(orgao_emissor_rg, 5)
        parts << justify_string(sigla_uf_outros_documentos, 2)

        parts << justify_string(descricao_profissao, 35)
        parts << justify_string(descricao_cargo, 35)

        parts << justify_number(cpf, 11)
        parts << justify_number(data_nascimento, 8)

        parts << justify_number(codigo_profissao, 8)
        parts << justify_value(valor_salario_liquido, 12)
        parts << justify_number(data_expedicao_rg, 8)
        parts << justify_string(observacao, 3000)
      end

      private

      def nacionalidade
        1 # fixed value from Lecca docs
      end

      def codigo_profissao
        1 # fixed value from Lecca docs
      end
      
    end
  end
end
