include_attribute "jetty"

expand! unless Chef::Config[:solo]

default[:solr][:version]   = "3.6.1"
default[:solr][:directory] = "/usr/local/src"
default[:solr][:checksum]  = "1b4552ba95c8456d4fbd596e82028eaa0619b6942786e98e1c4c31258543c708" #sha265

if solr.version.split('.').first.to_i >= 4
  default[:solr][:link]      = "http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/#{solr.version}/solr-#{solr.version}.tgz"
  default[:solr][:download]  = "#{solr.directory}/solr-#{solr.version}.tgz"
  default[:solr][:extracted] = "#{solr.directory}/solr-#{solr.version}"
  default[:solr][:war]       = "#{solr.extracted}/dist/solr-#{solr.version}.war"
else
  default[:solr][:link]      = "http://archive.apache.org/dist/lucene/solr/#{solr.version}/apache-solr-#{solr.version}.tgz"
  default[:solr][:download]  = "#{solr.directory}/apache-solr-#{solr.version}.tgz"
  default[:solr][:extracted] = "#{solr.directory}/apache-solr-#{solr.version}"
  default[:solr][:war]       = "#{solr.extracted}/dist/apache-solr-#{solr.version}.war"
end


default[:solr][:context_path]  = 'solr'
default[:solr][:home]          = "/etc/solr"
set[:solr][:config]            = node.solr.home + "/conf"
set[:solr][:lib]               = node.solr.home + "/lib"
default[:solr][:data]          = "#{node.jetty.home}/webapps/#{node.solr.context_path}/data"
default[:solr][:custom_config] = nil
default[:solr][:custom_lib]    = nil
