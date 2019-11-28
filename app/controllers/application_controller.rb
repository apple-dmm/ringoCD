class ApplicationController < ActionController::Base

#devise_parameter_sanitizer.parmit(追加したい処理の引数の値, key: [ﾊﾟﾗﾒｰﾀｰ1,ﾊﾟﾗﾒｰﾀｰ2])

	before_action :configure_permitted_parameters, if: :devise_controller?


protected

def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :residence, :phone_number])
end

def after_sign_in_path_for(resource_or_scope)
 if resource_or_scope.is_a?(Admin)
  admin_items_path
 else
  root_path
end
end

end

