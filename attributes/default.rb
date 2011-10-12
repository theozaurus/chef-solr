include_attribute "jetty"

expand!

default[:solr][:version]   = "1.4.1"
default[:solr][:link]      = "http://apache.favoritelinks.net/lucene/solr/#{solr.version}/apache-solr-#{solr.version}.tgz"
default[:solr][:checksum]  = "d795bc477335b3e29bab7073b385c93fca4be867aae345203da0d1e438d7543f"
default[:solr][:directory] = "/usr/local/src"
default[:solr][:download]  = "#{solr.directory}/apache-solr-#{solr.version}.tgz"
default[:solr][:extracted] = "#{solr.directory}/apache-solr-#{solr.version}"
default[:solr][:war]       = "#{solr.extracted}/dist/apache-solr-#{solr.version}.war"

default[:solr][:context_path] = 'solr'
default[:solr][:home]         = "#{node.jetty.home}/webapps/#{node.solr.context_path}"
default[:solr][:data]         = "#{node.jetty.home}/webapps/#{node.solr.context_path}/data"