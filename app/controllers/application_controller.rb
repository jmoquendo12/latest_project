class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?

    if current_user.admin?
      admin_users_path
    else
      root_path
    end
  end
end

