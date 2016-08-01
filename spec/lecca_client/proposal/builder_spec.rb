require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Builder do
  subject(:builder) { LeccaClient::Proposal::Builder.new(params) }

  let(:fixture_proposal) { File.read(File.expand_path('../../../fixtures/sample_proposal.txt', __FILE__)).chomp }
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

  describe '#line' do
    context 'with valid params' do
      it 'returns the proposal string' do
        expect(builder.line).to eq(fixture_proposal)
      end
    end

    context 'with invalid params' do
      let(:params) { nil }

      it 'raises ArgumentError' do
        expect{ builder.line }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#upload' do
    before do
      allow(LeccaClient::Uploader).to receive(:new).and_return(double(upload: true))
    end

    it 'uploads the file' do
      filename = "#{ProposalMock.operation[:numero_operacao]}.txt"

      builder.upload

      expect(LeccaClient::Uploader).to have_received(:new).with(builder.line, filename)
    end
  end
end
