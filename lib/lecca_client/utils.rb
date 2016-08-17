module LeccaClient
  module Utils
    def justify_string(string, length)
      I18n.transliterate(string.to_s).truncate(length, omission: '').ljust(length, ' ')
    end

    def justify_number(number, length)
      number.to_s.rjust(length, '0')
    end

    def justify_value(value, length, decimal_places = 2)
      value ||= 0
      ("%.#{decimal_places}f" % value).gsub(/[.,]/, '').rjust(length, '0')
    end
  end
end
