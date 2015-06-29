module TextHelper
  def format_app_name(app)
    name = app.name
    name << " #{app.name_suffix}" unless app.name_suffix.nil?
    name
  end
end
