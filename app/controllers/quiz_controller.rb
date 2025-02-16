class QuizController < ApplicationController
  before_action :authenticate_user!

  rescue_from Openai::OpenaiException do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def index
    @quizzes = Quiz.all.order(created_at: :desc)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = QuizzesServices.new(topic: params[:topic], length: 10).create
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  private 

  def quiz_params
    params.require(:quiz).permit(:topic, :length, :name)
  end
end
