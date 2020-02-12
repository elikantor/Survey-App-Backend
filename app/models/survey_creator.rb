class SurveyCreator < ApplicationRecord
    has_secure_password
    has_many :surveys
end
