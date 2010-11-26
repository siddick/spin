class <%= class_name %><%= "< #{options[:parent].classify}" if options[:parent] %>

<% unless options[:parent] -%>
  include DataMapper::Resource

  property :id, Serial
<% end %>
<% attributes.each do |attribute| -%>
  property :<%= attribute.name -%>, <%= attribute.type_class %>
<% end %>
  property :created_at, DateTime
  property :updated_at, DateTime

  def self.sort_records( sort_column, sort_direction )
    pkeys = properties.collect{|x| x.name.to_s }
    sort_column     = pkeys.include?( sort_column ) ? sort_column : 'created_at' 
    sort_direction  = sort_direction == 'desc' ? 'desc' : 'asc'
    all( :order => [ sort_column.to_sym.send( sort_direction ) ] )
  end

  def self.search( values )
    all
  end
    
end
