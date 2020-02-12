class SurveyCreatorSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :surveys
end
