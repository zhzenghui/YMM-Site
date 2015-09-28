class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create

    # Ksalt = "a153a34ac15f4856be224929ed0b547d"
#     用户名密码md5Ksalt

    warden.authenticate!(:scope => resource_name, :store => false, :recall => "#{controller_path}#failure")     
    current_user.reset_authentication_token!
    render :status => 200,
           :json => { :status => 1,
                      :msg => t("devise.sessions.signed_in"),
                      :result => { :name  => current_user.name, :email  => current_user.email,  :auth_token => current_user.authentication_token ,
                          :introduction =>current_user.introduction ,:avatar => current_user.avatar, :jinbi => current_user.jinbi,
                          :rmb => current_user.rmb
                        } }
  end


  

  def destroy
   
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

    current_user=User.find_by_authentication_token(params[:auth_token])
    current_user.update_column(:authentication_token, nil)

    render :status => 200,
           :json => { :status => 1,
                      :msg => t("devise.sessions.signed_out"),
                      :result => {} }
  end


  def failure
    render :status => 401,
           :json => { :status => 0,
                      :msg => "Login Failed",
                      :result => {} }
  end



  def sign_in_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end