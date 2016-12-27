# Checking Credit Cards by the Luhn algorithm
class CardCheck
  def initialize(number_string)
    @cardnumber = number_string.gsub(/\D/, '')
  end

  def valid?
    luhn_algorithm
  end

  def cardtype
    case
    when /^(34|37)/ =~ @cardnumber && number_length == 15
      'AMEX'
    when /^6011/ =~ @cardnumber && number_length == 16
      'Discover'
    when /^5[1-5]/ =~ @cardnumber && number_length == 16
      'MasterCard'
    when /^4/ =~ @cardnumber && (number_length == 13 || number_length == 16)
      'Visa'
    else
      'Unknown'
    end
  end

  private

  def luhn_algorithm
    check_digits = ''
    @cardnumber.split('').reverse.each_with_index do |digit, i|
      check_digits += i.odd? ? digit : (digit.to_i * 2).to_s
    end
    (check_digits.split('').map(&:to_i).reduce(:+) % 10).zero?
  end

  def number_length
    @number_length ||= @cardnumber.size
  end
end
