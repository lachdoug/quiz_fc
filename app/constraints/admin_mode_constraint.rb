class AdminModeConstraint

  def initialize( *roles )
    @roles = roles.map &:to_s
  end

  def matches?(request)
    return true if request.env['warden'].user(:admin).developer
    @roles.each do |role|
      return true if request.env['warden'].user(:admin).try( role )
    end
    return false
  end

end
