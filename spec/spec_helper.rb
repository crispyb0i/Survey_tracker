require('rspec')
require('pg')
require("sinatra/activerecord")
require('survey')
require('question')

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
  end
end
