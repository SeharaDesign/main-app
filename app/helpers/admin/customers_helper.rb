module Admin::CustomersHelper
  
  def formatted_addresses(addresses = [])
    return "NONE" if addresses == []
    addresses.each do |address|
      puts "#{address.street_address}"
      puts "#{address.city}, #{address.state}"
      puts "#{address.zip}, #{address.country}"
    end
  end

end
