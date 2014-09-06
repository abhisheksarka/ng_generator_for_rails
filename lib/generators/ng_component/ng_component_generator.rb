require_relative '../lib/utilities'

class NgComponentGenerator < Rails::Generators::Base
  include Utilities
  
  source_root File.expand_path('../templates/', __FILE__)
  argument :full_component_name, :type => :string, :default => "app::component"

  def create_directive
    template "directive.js.erb", root_directory_with('directive.js')
  end

  def create_template
    template "template.html.erb", root_directory_with('template.html')
  end

  def create_controller
    template "controller.js.erb", root_directory_with('controller.js')
  end

  def create_module
    template "module.js.erb", root_directory_with("module.js")
  end

  private

  def root_directory_with(file_name)
    "app/assets/javascripts/components/#{component_name(false)}/#{file_name}"
  end

  def full_component_name_to_arr
    full_component_name.split("::")
  end

  def namespace
    full_component_name_to_arr[0]
  end

  def module_name
    "#{namespace}.components.#{component_name}"
  end

  def component_name(camelize=true, uncapitalize_first=true)
    formatted_name(full_component_name_to_arr[1], camelize, uncapitalize_first)
  end

  def controller_name
    "#{module_name}.Controller"
  end

  def directive_name
    "#{namespace}#{component_name(true, false)}"
  end
end