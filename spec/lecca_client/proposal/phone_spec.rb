require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Phone do
  subject(:phone) { LeccaClient::Proposal::Phone.new(phone_hash) }

  let(:phone_hash) { ProposalMock.phone }

  describe '#build' do
    let(:line) { '21  000035075164000982512776                                                  21  ' }

    it 'builds the phone part' do
      expect(phone.build).to eq(line)
    end
  end
end
