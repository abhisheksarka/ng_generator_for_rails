require_relative '../lib/utilities'

class NgSectionGenerator < Rails::Generators::Base
  include Utilities
  
  source_root File.expand_path('../templates/', __FILE__)
  argument :full_section_name, :type => :string, :default => "app::section"

  def create_module
    template "module.js.erb", root_directory_with("module.js")
  end

  def create_controllers
    args.each do | arg |
      file_name = formatted_name(arg, false)
      self.send(:controller_name=, formatted_name(arg, true, false))
      template "controller.js.erb", root_directory_with("#{file_name}_controller.js")
    end

  end

  private

  def controller_name=(name)
    @controller_name = name
  end

  def controller_name
    @controller_name
  end

  def root_directory_with(file_name)
    "app/assets/javascripts/sections/#{section_name(false)}/#{file_name}"
  end

  def full_section_name_to_arr
    full_section_name.split("::")
  end

  def namespace
    full_section_name_to_arr[0]
  end

  def module_name
    "#{namespace}.sections.#{section_name}"
  end

  def section_name(camelize=true, uncapitalize_first=true)
    formatted_name(full_section_name_to_arr[1], camelize, uncapitalize_first)
  end
end