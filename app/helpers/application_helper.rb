module ApplicationHelper

  ERA_FACEBOOK_URL = "https://www.facebook.com/EthicalRescueAssociation"
  ERA_INSTAGRAM_URL = "https://www.instagram.com/ethicalrescueassociation/"
  ERA_TIKTOK_URL = "https://www.tiktok.com/@ethicalrescueassociation"
  ERA_MAILTO = "ethicalrescueassociation@gmail.com"

  def white_listed_ip_address?
    return true if request.ip == '127.0.0.1'
    return true if request.remote_ip == '71.77.179.72'
    return false
  end

  def logged_in_as_admin?
    current_user && current_user.admin?
  end
end
