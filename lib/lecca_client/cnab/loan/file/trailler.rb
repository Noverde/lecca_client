module LeccaClient::CNAB::Loan::File
  class Trailler < Hashie::Dash
    REGISTER_CODE = '9'

    property :codigo_registro, default: REGISTER_CODE
    property :quantidade_prestacoes
    property :valor_total_prestacoes
    property :numero_sequencial_registro
  end
end
