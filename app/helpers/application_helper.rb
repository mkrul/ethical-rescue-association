module ApplicationHelper

  ERA_FACEBOOK_URL = "https://www.facebook.com/EthicalRescueAssociation"
  ERA_INSTAGRAM_URL = "https://www.instagram.com/ethicalrescueassociation/"
  ERA_TIKTOK_URL = "https://www.tiktok.com/@ethicalrescueassociation"

  def session_access_key_set?
    session[:era] == true
  end

  def set_local_storage_key
    session[:era] = true
  end

  def insert_tab
    <<~HTML
      <span class="tab"></span>
    HTML
    .html_safe
  end
end
