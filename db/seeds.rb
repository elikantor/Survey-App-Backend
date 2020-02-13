# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Survey.destroy_all
SurveyCreator.destroy_all 

user1 = SurveyCreator.create(username: "Eli", password: "123")
user2 = SurveyCreator.create(username: "Baruch", password: "321")
survey1 = Survey.create(name: "A Survey", survey_creator: user1)
survey2 = Survey.create(name: "A Survey", survey_creator: user1)
survey3 = Survey.create(name: "A Survey", survey_creator: user2)
question1 = Question.create(survey: survey1, text: "First Question")
question2 = Question.create(survey: survey1, text: "second Question")
question3 = Question.create(survey: survey2, text: "Why did the chicken cross the road?")
question4 = Question.create(survey: survey2, text: "When?")
question5 = Question.create(survey: survey2, text: "Who?")
question6 = Question.create(survey: survey3, text: "How?")
