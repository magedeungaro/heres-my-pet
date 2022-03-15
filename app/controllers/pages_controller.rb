class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :ui_kitt]

  def landing
    redirect_to pets_path if user_signed_in?
  end

  def onboarding
  end

  def ui_kitt
  end
end
