class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing

  def landing
  end

  def onboarding
  end

  def ui_kitt
  end
end
