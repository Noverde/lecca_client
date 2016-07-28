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
    
    it 'builds the address part' do
      expect(address.build).to eq(line)
    end
  end
end

