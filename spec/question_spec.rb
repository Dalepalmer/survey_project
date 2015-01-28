require("spec_helper")


describe(Question) do

  describe(Question) do
    it("tells which survey the question belongs to") do
      survey = Survey.create({:survey_name => "Personality test"})
      question = Question.create({:question_name => "What is your favorite color?", :survey_id => survey.id})
      expect(question.survey()).to(eq(survey))
    end
  end
end
