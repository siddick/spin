module Spin
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator install Spin dependences"
      class_option "install", :type => :string, :default => "install"
      hook_for "install", :in => "jquery"

      source_root File.expand_path('../templates', __FILE__)

      def copy_generator_templates
        copy_file 'controller.rb', 'lib/templates/rails/rails/scaffold_controller/controller.rb'
        %w(edit _form index new show).each{|view_file|
          copy_file( "erb/#{view_file}.html.erb",
                    "lib/templates/rails/erb/scaffold/#{view_file}.html.erb" )
        }
        copy_file 'active_record.rb', 'lib/templates/rails/active_record/model/model.rb'
        copy_file 'data_mapper.rb', 'lib/templates/data_mapper/model/model.rb'
      end

      def copy_layouts
      end

    end
  end
end
