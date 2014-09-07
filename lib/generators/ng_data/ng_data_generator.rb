require_relative '../lib/utilities'

class NgDataGenerator < Rails::Generators::Base
  include Utilities

  source_root File.expand_path('../templates/', __FILE__)
  argument :data_name, :type => :string, :default => "app::resource"

  def create_data
    template "main.js.erb", "app/assets/javascripts/data/#{resource_name(false)}.js"
  end

  private

  def data_name_to_arr
    data_name.split("::")
  end

  def namespace
    data_name_to_arr[0]
  end

  def module_name
    "#{namespace}.data"
  end

  def resource_name(camelize=true, uncapitalize_first=true)
    formatted_name(data_name_to_arr[1], camelize, uncapitalize_first)
  end

  def factory_name
    "#{module_name}.#{resource_name(true, false)}"
  end

end