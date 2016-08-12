require 'spec_helper'

describe LeccaClient::CNAB::Loan::LoanFile do
  describe '#parse' do
    let(:file_content) { File.read(File.expand_path('spec/fixtures/sample_de_para.txt')) }

    subject { described_class.new(filename: 'sample.txt', filepath: './sample.txt', content: file_content).parse }

    it 'parses file' do
      expect(subject.header).to be_present
      expect(subject.details).to be_present
      expect(subject.trailler).to be_present
    end
  end

  describe '#purge' do
    subject { described_class.new(filename: 'sample.txt', filepath: './sample.txt', content: nil).purge }

    it 'removes file from remote repository' do
      file_handler = spy
      allow(LeccaClient::FileHandler).to receive(:new) { file_handler }

      subject

      expect(file_handler).to have_received(:remove).with('./sample.txt')
    end
  end

  describe '.retrieve_file' do
    subject(:loan_file) { described_class.retrieve_file('sample.txt') }

    it 'gets file from remote repository' do
      downloader = double
      allow(LeccaClient::Downloader).to receive(:new) { downloader }
      expect(downloader).to receive(:download_file).with('sample.txt') {
        { filename: 'sample.txt', filepath: './sample.txt', content: 'sample' }
      }

      expect(loan_file.filename).to eq 'sample.txt'
      expect(loan_file.filepath).to eq './sample.txt'
      expect(loan_file.content).to eq 'sample'
    end
  end

  describe '.available_files' do
    subject(:loan_files) { described_class.available_files }

    it 'gets all files from remote repository' do
      downloader = double
      allow(LeccaClient::Downloader).to receive(:new) { downloader }
      expect(downloader).to receive(:download_files).with(LeccaClient::CNAB::Loan::LoanFile::FILE_PREFIX) {
        [
          { filename: 'sample.txt', filepath: './sample.txt', content: 'sample' },
          { filename: 'sample.txt', filepath: './sample.txt', content: 'sample' }
        ]
      }

      expect(loan_files.count).to eq 2
    end
  end
end
