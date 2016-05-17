class Authorize
  include HTTParty

  CLIENT_ID = "c2ad8981609d4b11ab13252b21847689"
  SECRET = "9c36827575bd4defb36000e264e1509d"

  def self.spotify_token_response(code)
    base_url = "https://accounts.spotify.com/api/token"

    encoded = Base64.strict_encode64("#{CLIENT_ID}:#{SECRET}")
    headers = {"Authorization" => "Basic #{encoded}"}
    post_params = {
      "grant_type": "authorization_code",
      "code": code,
      "redirect_uri": "http://localhost:3000/sessions/spotify_callback"
    }
    HTTParty.post(base_url, body: post_params, headers: headers)
  end

  def self.authorize_url
    params = {
      "client_id": CLIENT_ID,
      "scope": "user-read-private",
      "redirect_uri": "http://localhost:3000/sessions/spotify_callback",
      "response_type": "code"
    };
    base_url = 'https://accounts.spotify.com/authorize?'
    url_params = params.to_query
    base_url + url_params
  end

end
