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

post('/surveys') do
  survey_name = params.fetch("survey_name")
  survey = Survey.new({:survey_name => survey_name, :id => nil})
  survey.save()
  @surveys = Survey.all()
  erb(:index)
end
