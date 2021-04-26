# frozen_string_literal: true

# Returns 'no fillings' when cookie filling is empty
module CookiesHelper
  def get_filling_message(cookie)
    cookie.fillings.strip.empty? ? 'no fillings' : cookie.fillings
  end
end
