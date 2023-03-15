module ApplicationHelper

  def logged_in_as_admin?
    current_user && current_user.admin?
  end
end
