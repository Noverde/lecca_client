require 'spec_helper'

describe LeccaClient::Proposal::Job do
  subject(:job) { LeccaClient::Proposal::Job.new(job_hash) }

  let(:job_hash) do
    {
      razao_social: 'CSSUB CONSULTORIA SOLU SUBMARI',
      data_admissao: '20151116',
      endereco: 'RUA MORRO DOIS IRMAOS',
      numero: 83,
      complemento: 'LT9 PAL31192',
      bairro: 'FREGUESIA JACA',
      cidade: 'RIO DE JANEIRO',
      uf: 'RJ',
      renda: 2275.00,
      cep: '00022760' # this CEP does not exists, but it was in the example 
                      # file provided by Lecca
    }
  end

  describe '#build' do
    let(:line) { 'CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA JACA                RIO DE JANEIRO                          RJ00000022750000022760' }

    # 07                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    it 'builds the job part' do
      expect(job.build).to eq(line)
    end
  end
end
