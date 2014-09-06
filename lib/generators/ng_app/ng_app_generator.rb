class NgAppGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/', __FILE__)
  argument :app_name, :type => :string, :default => "app"

  def create_app_module
    template "app_module.js.erb", "app/assets/javascripts/module.js"
  end

  def create_components_module
    template "components_module.js.erb", "app/assets/javascripts/components/module.js"
  end

  def create_data_module
    template "data_module.js.erb", "app/assets/javascripts/data/module.js"
  end

  def create_sections_module
    template "sections_module.js.erb", "app/assets/javascripts/sections/module.js"
  end

  private 

  def app_module_name
    app_name
  end

  def components_module_name
    "#{app_name}.components"
  end

  def sections_module_name
    "#{app_name}.sections"
  end

  def data_module_name
    "#{app_name}.data"
  end


end