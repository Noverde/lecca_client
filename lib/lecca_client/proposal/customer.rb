module LeccaClient
  module Proposal
    class Customer < Hashie::Dash
      property :codigo_produto, required: true

      def build
        '1'
      end

      private

      def config
        LeccaClient.config
      end
    end
  end
end
