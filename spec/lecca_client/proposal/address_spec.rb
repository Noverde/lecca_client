require 'spec_helper'

describe LeccaClient::Proposal::Address do
  subject(:address) { LeccaClient::Proposal::Address.new(address_hash) }

  let(:address_hash) do
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

  describe '#build' do
    let(:line) { '1Rua Alba Valdez                                             00228CASA                          RJCpo Grande                    Rio de Janeiro                          0000123075130' }
    # 0021000035075164000982512776                                                  0021CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA (JACA               RIO DE JANEIRO                          RJ0000002275000002276007                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    
    it 'builds the address part' do
      expect(address.build).to eq(line)
    end
  end
end

