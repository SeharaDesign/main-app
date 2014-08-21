class Data
  class Sanitization 

    def self.test
      puts "test"
    end

    def self.customer_data(params)
      params[:first_name].capitalize!
      params[:last_name].capitalize!
      params[:email].downcase!
      params[:phone] = Data::Sanitization.normalize_phone_number(params[:phone])

      params
    end

    def self.normalize_phone_number(phone)
      digits_only = phone.gsub(/[\s\D]/, '')
      digits_only.match(/(\d*)(\d{3})(\d{3})(\d{4})/)
      
      "#{$1}-#{$2}-#{$3}-#{$4}"
    end

    def self.shipping_address(params)
      params.each do |key, value|
        value.split(' ').map { |x| x.capitalize! }.join(' ')
      end
      params[:state].upcase!

      params
    end
  end
end