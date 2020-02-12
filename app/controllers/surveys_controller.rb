class SurveysController < ApplicationController

    def index 
        surveys = Survey.all
        render json: surveys
    end 

    def show 
        survey = Survey.find(params[:id])
        render json: survey
    end
end
