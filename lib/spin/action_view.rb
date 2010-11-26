module Spin
  module ActionView
    def sortable_link( key, display_key = nil )
      display_key ||= key
      if( key == params[:_sort].to_s )
        link_to key, params.merge( :_direction => ( sort_direction == 'asc' ? 'desc' : 'asc' ) )
      else
        link_to display_key, params.merge( :_sort => key, :_direction => 'asc' ) 
      end
    end
  end
end
    
