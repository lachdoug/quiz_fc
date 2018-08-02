class AdminModeConstraint

  def initialize( *roles )
    @roles = roles.map &:to_s
  end

  def matches?(request)
    current_admin_role = request.env['warden'].user(:admin).try(:role)
    return true if current_admin_role == "developer"
    @roles.include? current_admin_role
  end

end
