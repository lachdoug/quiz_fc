class IndexController < ApplicationController

  def show
    Rails.application.load_seed
  rescue => e
    render test: "#{e}\n\n#{e.backtrace}"
  end

end
