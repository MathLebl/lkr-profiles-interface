class Auth < ApplicationService
  def initialize(user, token)
    @user = user
    @token = token
  end

  def call
    p "on y va"
    url = 'https://linkalyze.app/api/auth'
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json', 'accept' => 'application/json'})

    request.body = {
      username: "#{@user.username}",
      password: "#{@user.user_password}"
    }.to_json
    response = http.request(request)

    @body = JSON.parse(response.body)
    toky = @body["token"]
    p @body
    if @token.blank?
      Token.create(content: toky, user_id: @user.id)
    elsif @token.content != toky
      # @token.destroy
      Token.update(content: toky)
    else
    end
  end
end
