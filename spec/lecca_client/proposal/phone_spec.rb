require 'spec_helper'

describe LeccaClient::Proposal::Phone do
  subject(:phone) { LeccaClient::Proposal::Phone.new(phone_hash) }

  let(:phone_hash) do
    {
      ddd_telefone: 21,
      telefone: '35075164',
      celular: '982512776',
      ddd_celular: 21
    }
  end

  describe '#build' do
    let(:line) { '0021000035075164000982512776                                                  0021' }
    
    it 'builds the phone part' do
      expect(phone.build).to eq(line)
    end
  end
end
