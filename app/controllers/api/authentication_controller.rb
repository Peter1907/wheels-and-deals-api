class Api::AuthenticationController < Api::ApiController
  skip_before_action :authenticate_request, only: [:login]

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: }, status: :ok
    elsif @user.nil?
      render json: {
        error: 'This user does not exist, you must create an account first'
        }, status: :not_found
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
