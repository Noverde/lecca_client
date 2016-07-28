require 'erb'
require 'yaml'

module LeccaClient
  class Configuration
    attr_accessor :environment, :logger, :config_file_path

    def config_file_path
      @config_file_path || 'config/lecca_client.yml'
    end

    def environment
      @environment || ENV['RACK_ENV'] || ENV['RAILS_ENV'] || raise('You must set the environment!')
    end

    def ftp
      config['ftp']
    end

    def proposal
      config['proposal']
    end

    private

    def config
      @config ||= Hashie::Mash.load(config_file_path)[environment]
    end
  end
end
