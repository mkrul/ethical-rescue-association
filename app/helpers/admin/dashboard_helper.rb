module Admin::DashboardHelper

  def set_active_link(active_link)
    return "is-active" if active_link == controller_path
  end

end
