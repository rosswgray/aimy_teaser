class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_user
    wechat_params = {
      appId: ENV["WECHAT_APP_ID"],
      secret: ENV["WECHAT_APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: {
      user: @user
    }
  end
end
