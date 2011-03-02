require 'uri'
require 'eventmachine'

require File.expand_path('sample_setting', File.dirname(__FILE__))
url = URI.parse(@url)

body = nil
EM.run do
  done = false
  requests = 0
  client = EM::Protocols::HttpClient2.connect(url.host, url.port)
  req = client.get(url.path)
  req.callback {
    body = req.content
    EM.stop if done
  }
  done = true
end

p body.size
