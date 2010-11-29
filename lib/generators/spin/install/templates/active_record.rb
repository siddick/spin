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
    scoped
  end

end
