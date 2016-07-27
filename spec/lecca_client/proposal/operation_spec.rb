require 'spec_helper'

describe LeccaClient::Proposal::Operation do
  subject(:operation) { LeccaClient::Proposal::Operation.new(operation_hash) }

  let(:operation_hash) do
    {
      data_operacao: '20160613',
      numero_operacao: 127329,
      taxa_juros: 17.50,
      data_primeira_parcela: '20160710',
      valor_compra: 1500.00,
      valor_entrada: 0,
      valor_cac: 60.00,
      quantidade_parcela: 8,
      valor_parcela: 381.51,
      valor_ioc: 19.89,
      digito_agencia_doc: 'x',
      digito_conta_doc: '7',
      nome_favorecido_doc: 'FERNANDA LINS DA COSTA',
      praca_doc: 1,
      banco_doc: '001',
      agencia_doc: '3097',
      conta_doc: '21464',
      cpf_doc: '11861257724',
      tac_financiada: 'S',
      valor_doc: 1500.00
    }
  end

  describe '#build' do
    let(:line) { 'PROD20160613000A955299109363NOVERDE                            00000012732900000112000017500020160710000000000150000000000000000000000000000150000000000000006000008000000000038151000000000001989DIx7 FERNANDA LINS DA COSTA             00100130970002146400011861257724S000000000150000' }
    # FERNANDA LINS DA COSTA                                      000012 219087608                                                                                 LUZINETE RAMOS LINS DA COSTA       DIC    ASSALARIADO                        PRECESSA GIS                       11861257724198709240000000100000022750000000000<font color=green><font color=green><br><b>REGRAS</b><br><br>CLIENTE (NOVO) N√O POSSUI CONTRATOS NA BASE (QUITADOS OU ABERTOS)<BR></font><br><br> Usu·rio Conectado: VSIMONIN<br></font>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1Rua Alba Valdez                                             00228CASA                          RJCpo Grande                    Rio de Janeiro                          00001230751300021000035075164000982512776                                                  0021CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA (JACA               RIO DE JANEIRO                          RJ0000002275000002276007                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    it 'builds the operation proposal part' do
      expect(operation.build).to eq(line)
    end
  end
end
