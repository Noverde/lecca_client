require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::BankAccount do
  subject(:bank_account) { LeccaClient::Proposal::BankAccount.new(bank_account_hash) }

  let(:bank_account_hash) { ProposalMock.bank_account }

  describe '#build' do
    let(:line) { '07                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000' }

    it 'builds the bank account part' do
      expect(bank_account.build).to eq(line)
    end
  end
end
