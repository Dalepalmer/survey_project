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

post("/questions") do
  question_name = params.fetch("question_name")
  survey_id = params.fetch("survey_id").to_i()
  question = Question.new({:question_name => question_name, :survey_id => survey_id})
  question.save()
  @survey = Survey.find(survey_id)
  erb(:survey)
end

post('/surveys') do
  survey_name = params.fetch("survey_name")
  survey = Survey.new({:survey_name => survey_name, :id => nil})
  survey.save()
  @surveys = Survey.all()
  erb(:index)
end

get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

get("/surveys/:id/edit") do
  @survey = Survey.find(params.fetch("id").to_id())
  erb(:survey)
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
