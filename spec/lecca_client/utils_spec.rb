require 'spec_helper'

describe LeccaClient::Utils do
  subject(:utils) { (Class.new { include LeccaClient::Utils }).new }

  describe '#justify_string' do
    it 'justifies and removes non US chars' do
      expect(utils.justify_string('JOÃO', 12)).to eq('JOAO        ')
    end
  end

  describe '#justify_number' do
    it 'justifies given number' do
      expect(utils.justify_number(123, 12)).to eq('000000000123')
    end
  end

  describe '#justify_value' do
    context 'with default decimal_places' do
      it 'justifies given value' do
        expect(utils.justify_value(6000.30, 12)).to eq('000000600030')
      end
    end

    context 'with custom decimal_places' do
      it 'justifies given value and decimal places' do
        expect(utils.justify_value(6000.30, 12, 4)).to eq('000060003000')
      end
    end
  end
end
