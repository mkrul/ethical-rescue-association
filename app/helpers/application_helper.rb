module ApplicationHelper

  ERA_FACEBOOK_URL = "https://www.facebook.com/EthicalRescueAssociation"
  ERA_INSTAGRAM_URL = "https://www.instagram.com/ethicalrescueassociation/"
  ERA_TIKTOK_URL = "https://www.tiktok.com/@ethicalrescueassociation"

  def session_access_key_set?
    session[:phantom] == true
  end

  def set_local_storage_key
    session[:phantom] = true
  end

  def insert_tab
    <<~HTML
      <span class="tab"></span>
    HTML
    .html_safe
  end

  def strip_utc(t)
    return unless t

    t.strftime("%Y-%m-%d %H:%M:%S")
  end
end
