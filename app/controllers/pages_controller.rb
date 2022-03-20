class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :onboarding

  def landing
    redirect_to pets_path if user_signed_in?
  end

  def onboarding
  end

  def ui_kitt
  end

  def privacy_policy
  end

  def about
  end

  def contact
  end

  def hero
  end
end
