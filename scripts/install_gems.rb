CLIENTS = File.expand_path(File.dirname(__FILE__), '../clients.txt')

require 'csv'

require 'rbconfig'
# We have RbConfig.ruby from 1.9
ruby = File.join(RbConfig::CONFIG["bindir"], RbConfig::CONFIG["ruby_install_name"] + RbConfig::CONFIG["EXEEXT"])

CSV.parse(File.read(CLIENTS)) do |row|
  name, gem, repo = row.map { |e| e.strip }
  if gem == 'yes'
    system "#{ruby} -S gem install #{name} --user-install --no-ri --no-rdoc"
  end
end
