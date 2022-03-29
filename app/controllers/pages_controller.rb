class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :onboarding

  def landing
    redirect_to pets_path if user_signed_in?
  end

  def onboarding
    redirect_to pets_path if current_user.onboarded
  end

  def ui_kitt
  end

  def privacy_policy
  end

  def about
  end

  def contact
  end
end
