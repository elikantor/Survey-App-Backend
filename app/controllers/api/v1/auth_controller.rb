class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      @survey_creator = SurveyCreator.find_by(username: user_login_params[:username])
      #User#authenticate comes from BCrypt
      if @survey_creator && @survey_creator.authenticate(user_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @survey_creator.id })
        render json: { survey_creator: SurveyCreator.Serializer.new(@survey_creator), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
   
    private
   
    def user_login_params
      # params { survey_creator: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:survey_creator).permit(:username, :password)
    end
end
