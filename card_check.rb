# Checking Credit Cards by the Luhn algorithm
class CardCheck
  def initialize(number_string)
    @cardnumber = number_string.gsub(/\D/, '')
  end

  def valid?
    luhn_algorithm
  end

  def cardtype
    case @cardnumber
    when /^(34|37)[0-9]{13}$/
      'AMEX'
    when /^6011[0-9]{12}$/
      'Discover'
    when /^5[1-5][0-9]{14}$/
      'MasterCard'
    when /^4([0-9]{12}|[0-9]{15})$/
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
end
