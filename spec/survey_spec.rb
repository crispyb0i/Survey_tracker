require('spec_helper')

describe(Survey) do
  describe("#question") do
    it("tells which questions are in which survey") do
      test_survey = Survey.create({:name => "Favorite Drugs"})
      test_question = test_survey.questions.new({:content => 'Lorne'})
      test_survey.save()
      test_question.survey()
      expect(test_question.survey()).to(eq(test_survey))
    end
  end

  describe(Survey) do
  it("converts the first letter to uppercase") do
    survey = Survey.create({:name => "what superhero are you?"})
    expect(survey.name()).to(eq("What superhero are you?"))
    end
  end
end
