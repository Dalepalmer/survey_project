class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:name, {:presence => true, :length => {:maximum => 100}})

  define_method(:add_question) do |question|
    question.update({:survey_id => self.id().to_i()})
  end
end
