module CookieAuth
  extend ActiveSupport::Concern

  private

  def auth_via_cookie
    return unless user = find_token(session_cookie).user
    session[:user_id] = user.id
    self.session_cookie = Token.find_by_key(session_cookie).destroy.user.tokens.create.key
    redirect_back
  end

  def session_cookie=(value)
    cookies.delete(:_nimbus_session_id, domain: fqdn) && return if value.nil?
    cookies.encrypted[:_nimbus_session_id] = {
      value: value,
      expires: Time.now + eval(CONFIG[:token_expiry]),
      domain: fqdn
    }
  end

  def session_cookie
    cookies.encrypted[:_nimbus_session_id]
  end

  def find_token(key)
    token = Token.find_by_key(key)
    return Token.new unless token
    token.destroy && return if token.expired?
    token || Token.new
  end

  def fqdn
    URI.parse(request.original_url).host
  end
end
