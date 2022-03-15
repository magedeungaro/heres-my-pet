module PagesHelper
  def render_navbar
    if user_signed_in? && !current_page?(ui_path)
      render 'shared/bottom_navbar'
    end
  end
end
