require 'HTTParty'

module GoogleOauth

  def self.oauth(params)

    base_url = "https://accounts.google.com/o/oauth2/token"
    redirect_uri = "http://localhost:3000/oauth"

    headers = { "user-agent" => "jonathanbarcus",
                "content-type" => "application/x-www-form-urlencoded" }

    data = { code: params["code"],
              redirect_uri: redirect_uri,
              client_id: ENV['GOOGLE_CLIENT_ID'],
              scope: params["scope"],
              client_secret: ENV['GOOGLE_CLIENT_SECRET'],
              grant_type: "authorization_code" }

    response = HTTParty.post(base_url, :headers => headers, :body => data)

  end


end




