module UsersHelper
  def get_heading
    'User console'
  end

  def get_subheading_1
    '<i>Just a description in italic</i>'.html_safe
  end

  def get_subheading_2
    RailsFullSanitizer.sanitize('<i>Just a description in italic</i>')
  end
end