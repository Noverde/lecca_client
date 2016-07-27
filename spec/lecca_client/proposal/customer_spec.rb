require 'spec_helper'

describe LeccaClient::Proposal::Customer do
  subject(:customer) { LeccaClient::Proposal::Customer.new(customer_hash) }

  let(:customer_hash) do
    {
      nome: 'FERNANDA LINS DA COSTA',
      numero_rg: '219087608',
      nome_mae: 'LUZINETE RAMOS LINS DA COSTA',
      orgao_emissor_rg: 'DIC',
      descricao_profissao: 'ASSALARIADO',
      descricao_cargo: 'PRECESSA GIS',
      cpf: '11861257724',
      data_nascimento: '19870924',
      valor_salario_liquido: 2275.00,
      observacao: '<font color=green><font color=green><br><b>REGRAS</b><br><br>CLIENTE (NOVO) NAO POSSUI CONTRATOS NA BASE (QUITADOS OU ABERTOS)<BR></font><br><br> Usuario Conectado: VSIMONIN<br></font>'
    }
  end

  describe '#build' do
    let(:line) { 'FERNANDA LINS DA COSTA                                      00001  219087608                                                                                 LUZINETE RAMOS LINS DA COSTA       DIC    ASSALARIADO                        PRECESSA GIS                       11861257724198709240000000100000022750000000000<font color=green><font color=green><br><b>REGRAS</b><br><br>CLIENTE (NOVO) NAO POSSUI CONTRATOS NA BASE (QUITADOS OU ABERTOS)<BR></font><br><br> Usuario Conectado: VSIMONIN<br></font>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ' }
    # 1Rua Alba Valdez                                             00228CASA                          RJCpo Grande                    Rio de Janeiro                          00001230751300021000035075164000982512776                                                  0021CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA (JACA               RIO DE JANEIRO                          RJ0000002275000002276007                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    
    it 'builds the customer part' do
      expect(customer.build).to eq(line)
    end
  end
end
