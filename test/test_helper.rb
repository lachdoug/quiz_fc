ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase

  fixtures :all

  # config.before(:each, type: :system, js: true) do
  #   desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  #     'chromeOptions' => {
  #       'prefs' => {
  #         # 'download.default_directory' => Rails.root.join('spec/downloads'),
  #         'download.prompt_for_download' => false,
  #         # 'plugins.plugins_disabled' => ["Chrome PDF Viewer"]
  #       }
  #     }
  #   )
  #   driven_by :selenium, using: :chrome, options: { desired_capabilities: desired_capabilities }
  # end

  def self.setup_user
    setup do
      @user = users( :one )
      @user.save
      login_as @user, :scope => :user
    end
  end

  def self.setup_admin
    setup do
      @admin = admins( :one )
      @admin.save
      login_as @admin, :scope => :admin
    end
  end

  def self.setup_quiz
    setup do
      @quiz = quizzes( :one )
      @quiz.save
      @questions = questions( :one, :two )
      @questions.each { |q| q.quiz_id = @quiz.id }
      @questions.each &:save
    end
  end

  def self.setup_played_quiz
    setup do
      @played_quiz = quizzes( :one )
      @played_quiz.save
      @questions = questions( :one, :two )
      @questions.each { |q| q.quiz_id = @played_quiz.id }
      @questions.each &:save
      @play = plays( :one )
      @play.quiz_id = @played_quiz.id
      @play.save
    end
  end

  #
  # def self.setup_play( :one )
  #   setup do
  #     @play.save
  #   end
  # end


  def self.test_reset
    teardown do
      Warden.test_reset!
    end
  end

end
