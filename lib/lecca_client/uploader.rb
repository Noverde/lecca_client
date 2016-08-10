require 'net/sftp'

module LeccaClient
  class Uploader
    def initialize(text, filename)
      @text = text
      @filename = filename
    end

    def upload
      Net::SFTP.start(config[:host], config[:user], password: config[:pass]) do |sftp|
        sftp.file.open([config[:upload_path].to_s, @filename].join('/'), "w") do |file|
          file.puts @text
        end
      end
    end

    private

    def config
      @config ||= LeccaClient.config.ftp
    end
  end
end
