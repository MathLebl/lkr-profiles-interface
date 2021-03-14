class ReaderCsv < ApplicationService
  def initialize(user, token)
    @user = user
  end

  def call
    require 'csv'
    csv_options = {headers: true, header_converters: :symbol}
    filepath = '/Users/mathieuleblond/desktop/result_copie.csv'
    CSV.foreach(filepath, csv_options) do |row|
      puts row
    end
  end
end
