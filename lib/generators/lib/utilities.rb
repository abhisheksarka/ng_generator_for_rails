module Utilities

  def uncapitalize_first_char(s)
    s[0, 1].downcase + s[1..-1]
  end

  def formatted_name(name, camelize=true, uncapitalize_first=true)
    name = name.camelize if camelize
    name = uncapitalize_first_char(name) if uncapitalize_first
    name
  end

end