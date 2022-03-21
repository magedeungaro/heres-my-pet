class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :mark_as_read, :notifications_counter, :destroy_all], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :mark_as_read, :notifications_counter, :destroy_all], unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :email, :address, :phone, :nickname, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate, :email, :address, :phone, :nickname, :photo])
  end

  def after_sign_in_path_for(resource)
    pets_path(current_user) # your path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
