namespace :result do

  desc "Import result from csv"
  task read_csv: :environment do
    user = User.first
    csv_options = {headers: true, header_converters: :symbol}
    filepath = '/Users/mathieuleblond/desktop/result_tries.csv'
    urls = []

    CSV.foreach(filepath, csv_options) do |row|
      url = row[:profileurl].gsub('www.','').to_s
      urls << url
    end
    Profile.call(user, urls)
  end
end
