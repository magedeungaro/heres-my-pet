module PagesHelper
  def render_navbar
    if user_signed_in? && ((!current_page?(ui_path) && !@pet && !current_page?(user_path(current_user))) || @tag_reading)
      render 'shared/bottom_navbar'
    end
  end
end
