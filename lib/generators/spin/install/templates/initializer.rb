require 'will_paginate'

WillPaginate::ViewHelpers.pagination_options[:param_name] = '_page'

module Spin
  Menu       = YAML.load( File.open( Rails.root.to_s + "/config/menu.yml", "r" ) )
  TopMenu    = {}
  SubMenu  = {}

  Menu.each{|k,v|
    if( pmenu_name = v["parent_menu"] )
      SubMenu[ pmenu_name ] ||= {}
      SubMenu[ pmenu_name ][ k ] = v 
    else
      TopMenu[ k ] = v
    end
  }
  
end
