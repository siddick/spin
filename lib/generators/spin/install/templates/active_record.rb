class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  belongs_to :<%= attribute.name %>
<% end -%>

  def self.sort_records( sort_column, sort_direction )
    pkeys = column_names
    sort_column     = pkeys.include?( sort_column ) ? sort_column : 'created_at' 
    sort_direction  = sort_direction == 'desc' ? 'desc' : 'asc'
    order( " #{sort_column} #{sort_direction} " )
  end

  def self.search( values )
    if( values["q"] and values["q"] != "" )
      conds = columns.find_all{|c| c.type == :string }.collect{|c| " #{c.name} like ? " }
      if( conds.size > 0 )
        ary   = Array.new( conds.size, "%#{values["q"]}%" )
        ary.unshift( conds.join( " or " ) )
        return where( ary )
      end
    end
    scoped
  end

end
