module Spin
  module ActionView

    def spin_menu( menus = Spin::TopMenu, sub_menus = Spin::SubMenu, css_class = 'menu' )
      output = "<ul class='#{css_class}' >" + 
        menus.collect{|k,v|
          "<li><a href='#{v['url']||eval(k.to_s+"_path")}' >#{v['display']||k}</a>" +
            ( sub_menus[k] ? spin_menu( sub_menus[k], sub_menus, "sub_menu" ) : "" ) + "</li>"
        }.join("") + "</ul>"
      output.html_safe  
    end

    def sortable_link( key, display_key = nil )
      display_key ||= key
      if( key == params[:_sort].to_s )
        link_to display_key, params.merge( :_page => nil, :_direction => ( params[:_direction] == 'asc' ? 'desc' : 'asc' ),
		 :class => "sort #{params[:_direction]}" )
      else
        link_to display_key, params.merge( :_page => nil, :_sort => key, :_direction => 'asc' ) 
      end
    end
  end
end
    
