module Spin
  module ActionView
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
    
