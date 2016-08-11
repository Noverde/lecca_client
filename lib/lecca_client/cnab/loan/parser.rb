require 'ostruct'

module LeccaClient::CNAB
  module Loan
    class Parser
      def initialize(raw_file)
        @rows = raw_file.split("\n")
      end

      def parse
        file = OpenStruct.new(header: nil, details: [], trailler: nil)

        @rows.each do |row|
          register_code = row.slice(0)

          case register_code
          when File::Header::REGISTER_CODE
            file.header = parse_header(row)
          when File::Detail::REGISTER_CODE
            file.details << parse_detail(row)
          when File::Trailler::REGISTER_CODE
            file.trailler = parse_trailler(row)
          end
        end

        file
      end

      private

      def parse_header(row)
        File::Header.new(
          codigo_registro: row.slice(0).strip,
          numero_remessa_arquivo: row.slice(1, 4).strip,
          data_geracao_arquivo: row.slice(5, 8).strip,
          codigo_cliente: row.slice(13, 20).strip,
          hora_geracao_arquivo: row.slice(33, 6).strip,
          numero_sequencial_registro: row.slice(61, 6).strip
        )
      end

      def parse_detail(row)
        File::Detail.new(
          codigo_registro: row.slice(0).strip,
          numero_contrato_externo: row.slice(1, 12).strip,
          numero_contrato_lecca: row.slice(13, 12).strip,
          numero_cessa_lecca: row.slice(25, 5).strip,
          cpf_emitente: row.slice(30, 11).strip,
          numero_parcela: row.slice(41, 3).strip,
          data_vencimento_parcela: row.slice(44, 8).strip,
          valor_prestacao: row.slice(52, 7).strip,
          numero_sequencial_registro: row.slice(61, 6).strip
        )
      end

      def parse_trailler(row)
        File::Trailler.new(
          codigo_registro: row.slice(0).strip,
          quantidade_prestacoes: row.slice(1, 6).strip,
          valor_total_prestacoes: row.slice(7, 9).strip,
          numero_sequencial_registro: row.slice(61, 6).strip
        )
      end
    end
  end
end
