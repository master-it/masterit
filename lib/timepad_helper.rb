module TimepadHelper

  def add_to_timepad_maillist(user)
    uri = URI(configus.timepad.api_url)
    params = { 
      code: configus.timepad.api_key,
      id: configus.timepad.organization_id,
      m_id: configus.timepad.list_id,
      i0_email: user.email,
      i0_name: user.first_name,
      i0_surname: user.last_name,
      i0_middlename: user.patronymic
    }
    uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(uri)
  end

end
