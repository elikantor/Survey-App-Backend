class Survey < ApplicationRecord
  belongs_to :survey_creator
  has_many :questions
end
