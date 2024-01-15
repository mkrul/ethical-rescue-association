module ApplicationHelper

  ERA_FACEBOOK_URL = "https://www.facebook.com/EthicalRescueAssociation"
  ERA_INSTAGRAM_URL = "https://www.instagram.com/ethicalrescuealliance/"
  ERA_TIKTOK_URL = "https://www.tiktok.com/@ethicalrescuealliance"

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

  def strip_utc(t)
    return unless t

    t.strftime("%Y-%m-%d %H:%M:%S")
  end
end
