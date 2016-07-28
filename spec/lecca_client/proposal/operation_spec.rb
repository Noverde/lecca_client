require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Operation do
  subject(:operation) { LeccaClient::Proposal::Operation.new(operation_hash) }

  let(:operation_hash) { ProposalMock.operation }

  describe '#build' do
    let(:line) { 'PROD20160613000A955299109363NOVERDE                            00000012732900000112000017500020160710000000000150000000000000000000000000000150000000000000006000008000000000038151000000000001989DIx7 FERNANDA LINS DA COSTA             00100130970002146400011861257724S000000000150000' }

    it 'builds the operation proposal part' do
      expect(operation.build).to eq(line)
    end
  end
end
