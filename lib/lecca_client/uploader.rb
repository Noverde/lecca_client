require 'net/ftp'
require 'tempfile'

module LeccaClient
  class Uploader
    def initialize(text, filename)
      @text = text
      @filename = filename
    end

    def upload
      connection.putbinaryfile(file, @filename)
    end

    private

    def connection
      @connection ||= connect!
    end

    def file
      @file ||= begin
        tempfile = Tempfile.new
        tempfile.write(@text)
        tempfile.close

        tempfile
      end
    end

    def connect!
      ftp = Net::FTP.new
      ftp.connect(config[:host], config[:port])
      ftp.login(config[:user], config[:pass])

      ftp
    end

    def config
      @config ||= LeccaClient.config.ftp
    end
  end
end
