require("spec_helper")


  describe(Survey) do
  it("tells which questions belong to a survey") do
    survey = Survey.create({:survey_name => "survey"})
    question1 = Question.create({:question_name => "what is your favor color?", :survey_id => survey.id})
    question2 = Question.create({:question_name => "what is your sign?", :survey_id => survey.id})
    expect(survey.questions()).to(eq([question1, question2]))
  end
end

describe(Survey) do
  it("capitalizes the first letter of survey_name") do
    survey = Survey.create({:survey_name => "buffalo bill"})
    expect(survey.survey_name()).to(eq("Buffalo bill"))
  end
end
