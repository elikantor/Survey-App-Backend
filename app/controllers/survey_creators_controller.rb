class SurveyCreatorsController < ApplicationController
    before_action :authorized, only: [:persist]

    # def index 
    #     survey_creators = SurveyCreator.all
    #     render json: survey_creators
    # end 

    # def show 
    #     survey_creators = SurveyCreator.find(params[:id])
    #     render json: survey_creator
    # end
   
    # REGISTER
    def create
      @survey_creator = SurveyCreator.create(survey_creator_params)
      if @survey_creator.valid?
        wristband = encode_token({ survey_creator_id: @survey_creator.id })
        render json: { survey_creator: SurveyCreatorSerializer.new(@survey_creator), token: wristband }
      else
        render json: { error: 'Invalid username or password' }
      end
    end

    # LOGGING IN
    def login 
        @survey_creator = SurveyCreator.find_by(username: params[:username])
        # byebug
        if @survey_creator && @survey_creator.authenticate(params[:password])
            wristband = encode_token({survey_creator_id: @survey_creator.id})
            render json: {survey_creator: SurveyCreatorSerializer.new(@survey_creator), token: wristband}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def persist
        wristband = encode_token({survey_creator_id: @survey_creator.id})
        render json: {survey_creator: SurveyCreator.new(@survey_creator), token: wristband}
    end
   
    private
   
    def survey_creator_params
      params.permit(:username, :password)
    end
end