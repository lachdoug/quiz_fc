class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def class_name_for_errors
  #   self.class.name.gsub( "::", " " ).gsub( "_", " " ).downcase
  # end

end
