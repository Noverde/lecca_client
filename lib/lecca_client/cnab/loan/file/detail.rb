module LeccaClient::CNAB::Loan::File
  class Detail < Hashie::Dash
    REGISTER_CODE = '1'

    property :codigo_registro, default: REGISTER_CODE
    property :numero_contrato_externo
    property :numero_contrato_lecca
    property :numero_cessa_lecca
    property :cpf_emitente
    property :numero_parcela
    property :data_vencimento_parcela
    property :valor_prestacao
    property :numero_sequencial_registro
  end
end
