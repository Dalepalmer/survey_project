require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/question")
require("./lib/survey")
require("pg")

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

get("/question") do
  @question = Question.all()
  erb(:question)
end

post("/questions") do
  question_name = params.fetch("question_name")
  survey_id = params.fetch("survey_id").to_i()
  question = Question.create({:question_name => question_name, :survey_id => survey_id})
  @survey = Survey.find(survey_id)
  erb(:survey)
end

post('/surveys') do
  survey_name = params.fetch("survey_name")
  @survey = Survey.create({:survey_name => name})
  @surveys = Survey.all()
  erb(:index)
end

get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

get("/surveys/:id/edit") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch("/surveys/:id") do
  survey_name = params.fetch("survey_name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:survey_name => survey_name})
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end

get("/questions/:id/edit") do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

patch("/questions/:id") do
  question_name = params.fetch("question_name")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:question_name => question_name})
  @survey = @question.survey()
  erb(:survey)
end

delete("/questions/:id") do
  @question = Question.find(params.fetch("id").to_i())
  @question.delete()
  @questions = Question.all()
  erb(:survey)
end
