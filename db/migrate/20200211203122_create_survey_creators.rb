class CreateSurveyCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_creators do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
