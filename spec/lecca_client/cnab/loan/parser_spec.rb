require 'spec_helper'

describe LeccaClient::CNAB::Loan::Parser do
  describe '#parse' do
    subject(:file) { described_class.new(File.expand_path('spec/fixtures/sample_de_para.txt')).parse }

    describe 'header' do
      it 'parses file header' do
        header = file.header

        expect(header).to be_instance_of(LeccaClient::CNAB::Loan::File::Header)
        expect(header.codigo_registro).to eq '0'
        expect(header.numero_remessa_arquivo).to eq '0001'
        expect(header.data_geracao_arquivo).to eq '21062016'
        expect(header.codigo_cliente).to eq 'NOVERDE           14'
        expect(header.hora_geracao_arquivo).to eq '2516'
        expect(header.numero_sequencial_registro).to eq '00001'
      end
    end

    describe 'details' do
      it 'parses file details' do
        details = file.details

        expect(details.size).to eq 48

        expect(details.first).to be_instance_of(LeccaClient::CNAB::Loan::File::Detail)
        expect(details.first.codigo_registro).to eq '1'
        expect(details.first.numero_contrato_externo).to eq '000000000186'
        expect(details.first.numero_contrato_lecca).to eq '000023604909'
        expect(details.first.numero_cessa_lecca).to eq '03317'
        expect(details.first.cpf_emitente).to eq '11667608711'
        expect(details.first.numero_parcela).to eq '001'
        expect(details.first.data_vencimento_parcela).to eq '07072016'
        expect(details.first.valor_prestacao).to eq '0000168'
        expect(details.first.numero_sequencial_registro).to eq '000002'
      end
    end

    describe 'trailler' do
      it 'parses file trailler' do
        trailler = file.trailler

        expect(trailler).to be_instance_of(LeccaClient::CNAB::Loan::File::Trailler)
        expect(trailler.codigo_registro).to eq '9'
        expect(trailler.quantidade_prestacoes).to eq '000048'
        expect(trailler.valor_total_prestacoes).to eq '000008086'
        expect(trailler.numero_sequencial_registro).to eq '000050'
      end
    end
  end
end
