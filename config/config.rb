configure do
  set :admin_username, ENV['ADMIN_USERNAME'] || 'admin'      # Access the admin area via /admin
  set :admin_password, ENV['ADMIN_PASSWORD'] || 'password_'  # Make sure you set the Environment Variable in production

  set :question, ENV['QUESTION'] || 'How can we make the World a better place?'

  # Sessions
  use Rack::Session::Cookie

  # Template Engine
  set    :partial_template_engine, :erb
  enable :partial_underscores

  # Admin area Authentication
  authorize do |username, password|
    username == settings.admin_username && password == settings.admin_password
  end
end
