require "rails/railtie"
require "refs/view_helper"

class Refs
  class Railtie < Rails::Railtie
    config.refs = ActiveSupport::OrderedOptions.new
    config.refs.config_path = "config/refs.rb"

    initializer "refs-rails.setup" do |app|
      file = Rails.root.join(config.refs.config_path)
      app.config.to_prepare do
        load file
      end
    end

    initializer "refs-rails.action_controller" do
      ActiveSupport.on_load :action_controller do
        include Refs::ViewHelper
      end
    end
  end
end
