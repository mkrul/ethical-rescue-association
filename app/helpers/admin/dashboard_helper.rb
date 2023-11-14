module Admin::DashboardHelper

  def set_active_link(active_link)
    controller = request.path_parameters&.dig(:controller)
    action = request.path_parameters&.dig(:action)
    current_endpoint = "#{controller}##{action}"

    return "is-active" if active_link == current_endpoint
  end

end
