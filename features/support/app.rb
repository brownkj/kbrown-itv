require File.dirname(__FILE__) + '/site_prism_page'
require File.dirname(__FILE__) + '/site_prism_sub'
require_all File.dirname(__FILE__) + '/page_objects/*.rb'

SitePrismSubclass.results.each_pair do |method_name, class_name|
  self.class.send(:define_method, method_name) do
    class_name.new
  end
end
