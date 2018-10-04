class AdminModeConstraint

  def initialize( *roles )
    @roles = roles.map &:to_s
  end

  def matches?(request)
    return true if request.env['warden'].user(:admin).developer
    request.env['warden'].user(:admin).try( current_admin_role )
  end

end
