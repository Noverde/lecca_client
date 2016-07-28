require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Builder do
  subject(:generator) { LeccaClient::Proposal::Builder.new(params) }

  let(:fixture_proposal) { File.read(File.expand_path('../../../fixtures/sample_proposal.txt', __FILE__)).chomp }

  describe '#create' do
    context 'with valid params' do
      let(:params) do
        {
          operacao: ProposalMock.operation,
          cliente: ProposalMock.customer,
          endereco: ProposalMock.address,
          telefone: ProposalMock.phone,
          emprego: ProposalMock.job,
          conta_bancaria: ProposalMock.bank_account
        }
      end

      it 'returns the proposal string' do
        expect(generator.create).to eq(fixture_proposal)
      end
    end

    context 'with invalid params' do
      let(:params) { nil }

      it 'raises ArgumentError' do
        expect{ generator.create }.to raise_error(ArgumentError)
      end
    end
  end
end
