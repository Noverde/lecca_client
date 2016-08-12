require 'net/sftp'

module LeccaClient
  class Downloader
    def download_file(filename)
      file = {}

      Net::SFTP.start(config[:host], config[:user], password: config[:pass]) do |sftp|
        file = {
          filename: filename,
          filepath: download_path(filename),
          content: sftp.download!(download_path(filename))
        }
      end

      file
    end

    def download_files(prefix = nil)
      files = []

      Net::SFTP.start(config[:host], config[:user], password: config[:pass]) do |sftp|
        sftp.dir.foreach(download_path) do |entry|
          next if !entry.file? || (prefix.present? && !entry.name.include?(prefix))

          files << {
            filename: entry.name,
            filepath: download_path(entry.name),
            content: sftp.download!(download_path(entry.name))
          }
        end
      end

      files
    end

    private

    def download_path(file_path = nil)
      [(config[:download_path] || '.'), file_path].join('/')
    end

    def config
      @config ||= LeccaClient.config.ftp
    end
  end
end
