class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  def pluralize( *args )
    ActionController::Base.helpers.pluralize( *args )
  end

end
