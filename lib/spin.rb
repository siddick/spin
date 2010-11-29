require 'jquery-rails'
require 'will_paginate'
require 'formtastic'

module Spin
  class Railtie < ::Rails::Railtie
    initializer "spin.action_view" do |app|
      require 'spin/action_view'
      ::ActionView::Base.send(:include, Spin::ActionView )
    end
    generators do
      require 'rails/generators/erb/scaffold/scaffold_generator'
      ::Erb::Generators::ScaffoldGenerator.class_eval do
        def available_views
          %w(index edit show new _form _page)
        end
      end
    end
  end
end
