class Authorize
  include HTTParty



  def self.spotify_token_response(code)
    base_url = "https://accounts.spotify.com/api/token"

    encoded = Base64.strict_encode64("#{ENV["SPOTIFY_CLIENT_ID"]}:#{ENV["SPOTIFY_SECRET"]}")
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

