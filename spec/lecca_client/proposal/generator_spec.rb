require 'spec_helper'

describe LeccaClient::Proposal::Generator do
  subject(:generator) { LeccaClient::Proposal::Generator.new(params) }

  let(:operacao) do
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

  let(:cliente) do
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

  let(:endereco) do
    {
      endereco: 'Rua Alba Valdez',
      numero: 228,
      complemento: 'CASA',
      uf: 'RJ',
      bairro: 'Cpo Grande',
      cidade:  'Rio de Janeiro',
      cep: '23075130'
    }
  end

  let(:telefone) do
    {
      ddd_telefone: 21,
      telefone: '35075164',
      celular: '982512776',
      ddd_celular: 21
    }
  end

  let(:emprego) do
    {
      razao_social: 'CSSUB CONSULTORIA SOLU SUBMARI',
      data_admissao: '20151116',
      endereco: 'RUA MORRO DOIS IRMAOS',
      numero: 83,
      complemento: 'LT9 PAL31192',
      bairro: 'FREGUESIA JACA',
      cidade: 'RIO DE JANEIRO',
      uf: 'RJ',
      renda: 2275.00,
      cep: '00022760'
    }
  end

  let(:conta_bancaria) do
    {
      digito_agencia: 0,
      digito_conta: 7,
      nome_favorecido: 'FERNANDA LINS DA COSTA',
      banco: '001',
      agencia: '3097',
      conta: '21464'
    }
  end

  let(:fixture_proposal) { File.read(File.expand_path('../../../fixtures/sample_proposal.txt', __FILE__)) }

  describe '#create' do
    context 'with valid params' do
      let(:params) do 
        { 
          operacao: operacao, 
          cliente: cliente, 
          endereco: endereco, 
          telefone: telefone, 
          emprego: emprego,
          conta_bancaria: conta_bancaria
        } 
      end

      it 'returns the proposal string' do
        require 'pry'; binding.pry
        expect(generator.create).to eq(fixture_proposal)
      end
    end

    context 'with invalid params' do
      let(:params) { nil }
      it 'raises ArgumentError' do
        expect{ generator.create }.to raise_error(ArgumentError)
      end
    end
  end
end
