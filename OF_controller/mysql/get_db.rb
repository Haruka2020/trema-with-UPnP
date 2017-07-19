require 'rbconfig'
require 'mysql2'
def os
  @os ||= (
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  )
end

def get_db
  if(os==:macosx)
    client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'root',:socket =>'/Applications/MAMP/tmp/mysql/mysql.sock')
  else
    client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'password')
  end
  return client
end
