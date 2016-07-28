require 'spec_helper'
require 'support/proposal_mock'

describe LeccaClient::Proposal::Job do
  subject(:job) { LeccaClient::Proposal::Job.new(job_hash) }

  let(:job_hash) { ProposalMock.job }

  describe '#build' do
    let(:line) { 'CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA JACA                RIO DE JANEIRO                          RJ00000022750000022760' }

    it 'builds the job part' do
      expect(job.build).to eq(line)
    end
  end
end
