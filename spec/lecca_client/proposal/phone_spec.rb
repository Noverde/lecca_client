require 'spec_helper'

describe LeccaClient::Proposal::Phone do
  subject(:phone) { LeccaClient::Proposal::Phone.new(phone_hash) }

  let(:phone_hash) do
    {
      ddd_telefone: 21,
      telefone: '35075164',
      celular: '982512776',
      ddd_celular: 21
    }
  end

  describe '#build' do
    let(:line) { '0021000035075164000982512776                                                  0021' }
                # 0021000035075164000982512776                                                  0021CSSUB CONSULTORIA SOLU SUBMARI2015111600000000000000RUA MORRO DOIS IRMAOS                                       00083LT9 PAL31192                  FREGUESIA (JACA               RIO DE JANEIRO                          RJ0000002275000002276007                     1FERNANDA LINS DA COSTA             000000000000001001309700021464001001000000000 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    
    it 'builds the phone part' do
      expect(phone.build).to eq(line)
    end
  end
end
