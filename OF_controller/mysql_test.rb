require 'mysql2'
ip = '192.168.11.1'
port = '50324'

client = Mysql2::Client.new(:host => 'localhost', :user => 'root', :password => 'password')
query = %Q{select * from UPnP_List.rootDevice Where ip = '#{ip}' and port = '#{port}'}
#query = %q{select * from UPnP_List.rootDevice Where port = '50324' and ip = '192.168.11.1'}
results = client.query(query)
results.each do |row|
  puts "--------------------"
  row.each do |key, value|
    puts "#{key} => #{value}"
  end
end
