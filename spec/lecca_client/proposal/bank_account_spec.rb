require 'spec_helper'

describe LeccaClient::Proposal::BankAccount do
  subject(:bank_account) { LeccaClient::Proposal::BankAccount.new(bank_account_hash) }

  let(:bank_account_hash) do
    {
      digito_agencia: 0,
      digito_conta: 7,
      nome_favorecido: 'FERNANDA LINS DA COSTA',
      banco: '001',
      agencia: '3097',
      conta: '21464'
    }
  end

  describe '#build' do
    let(:line) { '07                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001000000000' }

    it 'builds the bank account part' do
      expect(bank_account.build).to eq(line)
    end
  end
end
