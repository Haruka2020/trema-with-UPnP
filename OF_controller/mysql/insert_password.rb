def insert_password()
  client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'root',:socket =>'/Applications/MAMP/tmp/mysql/mysql.sock')
  id =''
  password = Array.new(32){[*:a..:z,*0..9].sample}.join
  remote_password = Array.new(32){[*:a..:z,*0..9].sample}.join
  sql = %Q{Insert Into UPnP_List.OneTime (password,remote_password) Values ( '#{password}','#{remote_password}'  ) }
  results =client.query(sql)
  sql = %Q{select last_insert_id()}
  results = client.query(sql)
  results.each do |record|
    id = record['last_insert_id()']
  end
  return id,password,remote_password
end
