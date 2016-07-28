require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::BankAccount do
  subject(:bank_account) { LeccaClient::Proposal::BankAccount.new(bank_account_hash) }

  let(:bank_account_hash) { ProposalMock.bank_account }

  context 'when product code is CP' do
    before do
      allow(LeccaClient).to receive_message_chain(:config, :proposal).and_return({ codigo_produto: 'CP' })
      bank_account_hash[:digito_agencia] = nil
    end

    it 'returns error if required field are not filled' do
      expect { bank_account.build }.to raise_error(ArgumentError)
    end
  end

  context 'when product code is not CP' do
    it 'does not require fields to be filled' do
      bank_account_hash[:digito_agencia] = nil

      expect { bank_account.build }.not_to raise_error(ArgumentError)
    end
  end

  describe '#build' do
    let(:line) { '07                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000' }

    it 'builds the bank account part' do
      expect(bank_account.build).to eq(line)
    end
  end
end
