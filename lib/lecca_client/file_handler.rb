require 'net/sftp'

module LeccaClient
  class FileHandler
    def remove(filepath)
      Net::SFTP.start(config[:host], config[:user], password: config[:pass]) do |sftp|
        sftp.remove!(filepath)
      end
    end

    private

    def config
      @config ||= LeccaClient.config.ftp
    end
  end
end
