module PagesHelper
  def render_navbar
    unless current_page? ui_path
      render 'shared/navbar'
    end
  end
end
