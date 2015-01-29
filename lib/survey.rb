class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:survey_name, {:presence => true, :length => {:maximum => 100}})
  before_save(:capitalize_survey_name)

  define_method(:add_question) do |question|
    question.update({:survey_id => self.id().to_i()})
  end

  scope(:not_done, -> do
    where({:done => false})
  end)

 private

  define_method(:capitalize_survey_name) do
    self.survey_name=(survey_name().capitalize())
  end
end
