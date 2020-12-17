class ApplicationController < ActionController::API
  def check_authorization
    token = request.headers['token']
    puts request.headers['token']
    puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'

    begin
      decoded_token = JWT.decode(
        token,
        Rails.application.secrets.secret_key_base,
        'HS256'
      )
      data = decoded_token[0][0]

      user_id = data['id']

      user = User.find(user_id)
    rescue StandardError
      user = nil
    end

    # data = decoded_token[0][0]

    # user_id = data['id']

    # user = User.find(user_id)

    # user.as_json
    user
    # puts decoded_token
    # puts '#######################################3'
  end
end
