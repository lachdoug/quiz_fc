ActionDispatch::Routing::Mapper.class_eval do

  def authorize_admin( admin_mode )
    constraints AdminModeConstraint.new( :quizmaster ) do
      yield
    end
  end
  
end
