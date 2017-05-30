module ApplicationHelper
  def current_page
    params[:page].present? ? params[:page].to_i : 1
  end
end
