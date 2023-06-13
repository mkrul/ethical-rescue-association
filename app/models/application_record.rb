class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  LOCALHOST = "localhost:3000"
  PRODUCTION_ROOT_URL = "https://www.ethicalrescueassociation.com"

  ROOT_URL = Rails.env.development? ? LOCALHOST : PRODUCTION_ROOT_URL

end
