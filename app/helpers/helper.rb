helpers do
  def current_user
    if session[:user_id]
     @current_user ||= User.find(session[:user_id])
    end
  end

  def parse_survey_params(params)
  	survey_title = params[:title]
  	question_text = params[:question_text_1]
  	choice_a = params[:choice_text_1a]
  	choice_b = params[:choice_text_1b]
  	choice_c = params[:choice_text_1c]
  	choice_d = params[:choice_text_1d]
  	survey = Survey.create(title: survey_title)
  	question = Question.create(text: question_text, survey_id: survey.id)
  	Choice.create(text: choice_a, question_id: question.id)
  	Choice.create(text: choice_b, question_id: question.id)
  	Choice.create(text: choice_c, question_id: question.id)
  	Choice.create(text: choice_d, question_id: question.id)
  end
end