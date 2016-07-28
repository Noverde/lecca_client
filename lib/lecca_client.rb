module LeccaClient
  def self.config
    @config ||= LeccaClient::Configuration.new
    yield @config if block_given?
    @config
  end
end

require 'hashie'
require 'lecca_client/active_support'
require 'lecca_client/version'
require 'lecca_client/configuration'
require 'lecca_client/utils'
require 'lecca_client/uploader'

require 'lecca_client/proposal/operation'
require 'lecca_client/proposal/customer'
require 'lecca_client/proposal/phone'
require 'lecca_client/proposal/address'
require 'lecca_client/proposal/job'
require 'lecca_client/proposal/bank_account'
require 'lecca_client/proposal/builder'

