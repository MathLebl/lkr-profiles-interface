namespace :google do
  desc "Export result to google sheets"
  task wright_gsheets: :environment do
    session = GoogleDrive::Session.from_config("public/client_secret.json")
    ws = session.spreadsheet_by_key("1C4Sjs7xKmQqrBe6dc_-5TyNjV7JqCPOXNw7EmaiGL2g").worksheets[0]
    a = ws.num_rows + 1
    body = "{\"id\":\"5df395fd9ebb284a706d07b7\",\"url\":\"https:\\/\\/linkedin.com\\/in\\/thomas-pons-lyon\",\"fullName\":\"Thomas PONS\",\"headline\":\"Fondateur de Linkalyze\",\"profilePicture\":\"https:\\/\\/media-exp1.licdn.com\\/dms\\/image\\/C4D03AQGlJwVplnc9xA\\/profile-displayphoto-shrink_800_800\\/0\\/1516486803099?e=1620259200\\u0026v=beta\\u0026t=uM8jLNtLKp4RAk8XW6LW3lB_qoWRkiGCI5NNlhsmFnk\",\"company\":\"Linkalyze\",\"location\":\"Lyon\",\"country_code\":\"N\\/A\",\"city\":\"N\\/A\",\"administrativeAreaLevel\":\"N\\/A\",\"email\":\"thomas@prezmaker.com\",\"subscribers\":9788,\"skills\":[{\"name\":\"influence marketing\",\"endorsements\":\"11\"},{\"name\":\"Communication marketing\",\"endorsements\":\"22\"},{\"name\":\"Strat\\u00e9gie marketing\",\"endorsements\":\"11\"},{\"name\":\"Graphic Design\",\"endorsements\":\"16\"}],\"averageLikes\":114,\"averageComments\":75,\"frequency\":753,\"engagementRate\":0.019309358398038413,\"estimatedValue\":871,\"updatedAt\":1614712477,\"topics\":{\"linkedin\":30,\"sylvain\":10,\"permet\":7,\"influence\":15,\"suivre\":6,\"analyse\":8,\"linkalyze\":18,\"profils\":6,\"communaut\\u00e9\":7,\"aider\":6,\"formation\":13,\"post\":17,\"semaine\":6,\"marketing\":6,\"nombre\":6,\"non\":6,\"posts\":6,\"lancer\":8,\"mois\":7,\"app\":7,\"semaines\":8,\"lancement\":7,\"outil\":14,\"extension\":9,\"beaucoup\":6,\"jour\":6,\"tester\":6,\"growth\":6,\"d\\u00e9cid\\u00e9\":6,\"commentaire\":8,\"mots\":6,\"veille\":7}}"
    b = JSON.parse(body)
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
    ws[a, 13] = b['skills'].map { |skill| "#{skill["name"]} : #{skill["endorsements"]}" }.join("\n")
    ws[a, 14] = b['averageLikes']
    ws[a, 15] = b['averageComments']
    ws[a, 16] = b['frequency']
    ws[a, 17] = b['engagementRate']
    ws[a, 18] = b['estimatedValue']
    ws[a, 19] = b['updatedAt']
    ws[a, 20] = b['topics'].map { |topic| "#{topic[0]} : #{topic[1]}" }.join("\n")
    ws.save
  end
end





# ws.rows.first(6).each { |row| puts row.first(5).join(" | ")}
    # ws.insert_rows(ws.num_rows +1,
    #   [
    #     ["one", "two", "three"],
    #     ["une", "deux", "trois"]
    #   ])
    # ws[ws.num_rows +1] = ["one", "two", "three"]
    # p ws[2]
