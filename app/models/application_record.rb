class ApplicationRecord < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  primary_abstract_class

end
