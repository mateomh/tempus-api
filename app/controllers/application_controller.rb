class ApplicationController < ActionController::API
  def check_authorization
    token = request.headers['token']

    begin
      decoded_token = JWT.decode(
        token,
        Rails.application.secrets.secret_key_base,
        'HS256'
      )
      data = decoded_token[0]
      
      user_id = data['id']
      
      user = User.find(user_id)
    rescue StandardError
      user = nil
    end
    
    user
  end
end
