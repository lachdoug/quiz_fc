class IndexController < ApplicationController

  def show
    Rails.application.load_seed unless Admin.any?
  rescue => e
    render plain: "#{e}\n\n#{e.backtrace}"
  end

end
