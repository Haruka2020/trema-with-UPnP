require 'mysql2'

client = Mysql2::Client.new(:host => 'localhost', :user => 'root', :password => 'password')
query = %q{select deviceType from UPnP_List.device}
results = client.query(query)
results.each do |row|
  puts "--------------------"
  row.each do |key, value|
    puts "#{key} => #{value}"
  end
end
