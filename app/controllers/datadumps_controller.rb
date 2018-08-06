class DatadumpsController < ApplicationController

  def show
    filepath = "tmp/seeddump.rb"
    `rake db:seed:dump FILE=#{filepath}`
    send_file filepath, filename: 'quizfc_datadump.rb'
  end

end
