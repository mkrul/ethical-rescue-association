require 'active_interaction'

module ApplicationSubmissions
  class DetermineFormUrl < ActiveInteraction::Base
    string :organization
    string :specialization
    string :email

    FORM_DATA_LOOKUP = {
      dog_rescue: {
        entry_id: "1019037625",
        form_url: "https://docs.google.com/forms/d/e/1FAIpQLSeclt2wWzmUAaLbaMip2ux1d5Z4jJ3XmmIk2GxP8qONlH2fbA/viewform"
      },
      cat_rescue: {
        entry_id: "1170237906",
        form_url: "https://docs.google.com/forms/d/e/1FAIpQLSfDyptJDDnmKqrGw8HO_GEeiZ5-Xc7sPrhOUOq5ivaoGH50Jw/viewform",
      },
      dog_cat_rescue: {
        entry_id: "1690243568",
        form_url: "https://docs.google.com/forms/d/e/1FAIpQLSdn8K-m1wuAUqIlhvn6zjiJjS4klGzOLj6N9sZrO4fNHbOvHA/viewform"
      },
      shelter: {
        entry_id: "1407910400",
        form_url: "https://docs.google.com/forms/d/e/1FAIpQLSfIlU9glxiIqd4x9zmVPXe1bAN45qDlKt5C46c42wRkV4RXng/viewform"
      }
    }

    def execute
      generate_form_url
    end

    private

    def generate_form_url
      "#{form_data[:form_url]}?#{"entry.#{email_field_id}=#{email}"}"
    end

    def form_data
      @form_data ||= FORM_DATA_LOOKUP[form_type.to_sym]
    end

    def email_field_id
      form_data[:entry_id]
    end

    def form_type
      return 'shelter' if organization === 'shelter'
      if organization === 'rescue'
        return 'dog_rescue' if specialization === 'dogs'
        return 'cat_rescue' if specialization === 'cats'
        return 'dog_cat_rescue' if specialization === 'dogs_and_cats'
      end
    end

  end
end
