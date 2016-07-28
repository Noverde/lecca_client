module LeccaClient
  module Proposal
    class Job < Hashie::Dash
      include LeccaClient::Utils

      property :razao_social
      property :data_admissao
      property :cnpj
      property :endereco
      property :numero
      property :complemento
      property :complemento
      property :bairro
      property :cidade
      property :uf
      property :renda
      property :cep

      def build
        parts = ''

        parts << justify_string(razao_social, 30)
        parts << justify_number(data_admissao, 8)
        parts << justify_number(cnpj, 14)
        parts << justify_string(endereco, 60)
        parts << justify_number(numero, 5)
        parts << justify_string(complemento, 30)
        parts << justify_string(bairro, 30)
        parts << justify_string(cidade, 40)
        parts << justify_string(uf, 2)
        parts << justify_value(renda, 12)
        parts << justify_string(cep, 8)
      end
    end
  end
end

