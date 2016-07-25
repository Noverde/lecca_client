require 'spec_helper'

describe LeccaClient::Proposal::Generator do
  subject(:generator) { LeccaClient::Proposal::Generator.new(params) }

  let(:operacao) do
    {

    }
  end

  let(:cliente) do
    {

    }
  end

  let(:endereco) do
    {

    }
  end

  let(:telefone) do
    {
    }
  end

  describe '#create' do
    context 'with valid params' do
      let(:params) { { operacao: operacao, cliente: cliente, endereco: endereco, telefone: telefone } }

      it 'returns the proposal string' do
        expect(generator.create).to eq('PROD20160613000ALOJISTALOJA0NOVERDE                            ')
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