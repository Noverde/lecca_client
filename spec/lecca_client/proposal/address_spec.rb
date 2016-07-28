require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Address do
  subject(:address) { LeccaClient::Proposal::Address.new(address_hash) }

  let(:address_hash) { ProposalMock.address }

  describe '#build' do
    let(:line) { '1Rua Alba Valdez                                             00228CASA                          RJCpo Grande                    Rio de Janeiro                          0000123075130' }
    
    it 'builds the address part' do
      expect(address.build).to eq(line)
    end
  end
end

