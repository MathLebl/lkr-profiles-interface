class Profile < ApplicationService
  def initialize(user, urls)
    @user = user
    @content = @user.token.content
    @urls = urls
  end

  def call
    api_url = 'https://linkalyze.app/api/profile'
    uri = URI.parse(api_url)
    headers = {
      'Authorization'=>"Bearer #{@content}",
      'Content-Type' =>'application/json',
      'Accept'=>'application/json'
    }
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    http.use_ssl = true

    session = GoogleDrive::Session.from_config("public/client_secret.json")
    ws = session.spreadsheet_by_key("1C4Sjs7xKmQqrBe6dc_-5TyNjV7JqCPOXNw7EmaiGL2g").worksheets[0]

    @urls.each do |url|
      p url
      a = ws.num_rows + 1
      p a
      params = { url: url}
      request.set_form_data( params )
      request = Net::HTTP::Get.new(uri.path+ '?' + request.body, headers)
      response = http.request(request)
      b = JSON.parse(response.body)
      p b
      if b.first[0] == "error"
        ws[a, 1] = "ERROR"
        ws[a, 2] = url
        ws[a, 3] = b['error']
        ws.save
        p "saved"
      else
        ws[a, 1] = b['id']
        ws[a, 2] = b['url']
        ws[a, 3] = b['fullName']
        ws[a, 4] = b['headline']
        ws[a, 5] = b['profilePicture']
        ws[a, 6] = b['company']
        ws[a, 7] = b['location']
        ws[a, 8] = b['country_code']
        ws[a, 9] = b['city']
        ws[a, 10] = b['administrativeAreaLevel']
        ws[a, 11] = b['email']
        ws[a, 12] = b['subscribers']
        if !b['skills'].nil?
          ws[a, 13] = b['skills'].map { |skill| "#{skill["name"]} : #{skill["endorsements"]}" }.join("\n")
        end
        ws[a, 14] = b['averageLikes']
        ws[a, 15] = b['averageComments']
        ws[a, 16] = b['frequency']
        ws[a, 17] = b['engagementRate']
        ws[a, 18] = b['estimatedValue']
        ws[a, 19] = b['updatedAt']
        if !b["topics"].nil?
          ws[a, 20] = b['topics'].map { |topic| "#{topic[0]} : #{topic[1]}" }.join("\n")
        end
        ws.save
        p "saved"
      end
    end
  end
end
