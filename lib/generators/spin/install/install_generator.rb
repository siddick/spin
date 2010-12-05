module Spin
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator install Spin dependences"
      class_option "formtastic", :type => :string, :default => "formtastic"
	
      hook_for "formtastic", :in => "formtastic", :as => "install"

      source_root File.expand_path('../templates', __FILE__)

      def copy_generator_templates
        copy_file 'controller.rb', 'lib/templates/rails/scaffold_controller/controller.rb'
        %w(index _page new _form show edit).each{|view_file|
          copy_file( "erb/#{view_file}.html.erb",
                    "lib/templates/erb/scaffold/#{view_file}.html.erb" )
        }
        copy_file 'erb/spin.html.erb', 'app/views/layouts/spin.html.erb'
        copy_file 'public/spin.css', 'public/stylesheets/spin.css'
        copy_file 'active_record.rb', 'lib/templates/active_record/model/model.rb'
        copy_file 'data_mapper.rb', 'lib/templates/data_mapper/model/model.rb'
        copy_file 'initializer.rb', 'config/initializers/spin.rb'
      end

      def copy_layouts
      end

    end
  end
end
