require('pry')
require('launchy')
require('pg')
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('rake')
require('./lib/survey')
require('./lib/question')
require('./lib/user')
require('./lib/answer')
also_reload('./**/*.rb')

ENV['RACK_ENV'] = 'test'

get('/') do
  @users = User.all()
  erb(:index)
end

get('/user/new') do
  @users = User.all()
  erb(:index)
end

post('/user/new') do
  @users = User.all()
  name = params.fetch('name')
  User.new(:name => name).save
  erb(:index)
end

get('/user/:id/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

post('/survey/new') do
  @users = User.all()
  @surveys = Survey.all()
  survey_name = params.fetch('name')
  Survey.new(:name => survey_name).save
  erb(:index)
end

get('/survey/:id') do
  @questions = Question.all()
  @survey = Survey.find(params.fetch('id'))
  erb(:survey)
end

post('/survey/:id/question') do
  @questions = Question.all()
  @survey = Survey.find(params.fetch('id'))
  question = params.fetch('question')
  Question.new(:content => question, :survey_id => @survey.id).save
  erb(:survey)
end

post('/survey/:id/question/edit') do
  @question = Question.find(params.fetch('id'))
  erb(:question_edit)
end
