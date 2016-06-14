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

https://auth.teamsnap.com/oauth/authorize?client_id=2c741dcf1a63858f6f8581548d9da0145103e7f1ad5ae34738c33ac4a0df9dd8&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauthorizations%2Fcallback&response_type=code

https://auth.teamsnap.com/oauth/authorize?client_id=2c741dcf1a63858f6f8581548d9da0145103e7f1ad5ae34738c33ac4a0df9dd8&redirect_url=localhost%3A3000%2Fauthorizations%2Fcallback&response_type=code&scope=read+write
