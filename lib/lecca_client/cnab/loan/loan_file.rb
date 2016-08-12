module LeccaClient::CNAB
  module Loan
    class LoanFile
      FILE_PREFIX = 'LEC_DEPARA'

      attr_reader :filename, :filepath, :content

      def initialize(filename:, filepath:, content:)
        @filename = filename
        @filepath = filepath
        @content = content
      end

      def parse
        @parsed ||= Parser.new(content).parse
      end

      def purge
        LeccaClient::FileHandler.new.remove(filepath)
      end

      def self.retrieve_file(filename)
        new(LeccaClient::Downloader.new.download_file(filename))
      end

      def self.available_files
        files = LeccaClient::Downloader.new.download_files(FILE_PREFIX)
        files.map { |file| new(file) }
      end
    end
  end
end
