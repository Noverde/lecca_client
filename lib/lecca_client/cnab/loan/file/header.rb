module LeccaClient::CNAB::Loan::File
  class Header < Hashie::Dash
    REGISTER_CODE = '0'

    property :codigo_registro, default: REGISTER_CODE
    property :numero_remessa_arquivo
    property :data_geracao_arquivo
    property :codigo_cliente
    property :hora_geracao_arquivo
    property :numero_sequencial_registro
  end
end
