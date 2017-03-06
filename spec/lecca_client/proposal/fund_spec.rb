require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Fund do
  subject(:fund) { LeccaClient::Proposal::Fund.new(fund_hash) }

  let(:fund_hash) { ProposalMock.fund }

  describe '#build' do
    let(:line) { 'A 0000000000000000000000000000                                        000            ' }

    it 'builds the fund part' do
      expect(fund.build).to eq(line)
    end
  end
end
