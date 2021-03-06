class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @drill = Drill.find(params[:drill_id])
    @question = Question.new
  end

  def create
    drill = Drill.find(params[:drill_id])
    question = Question.create(question_params)
    question.drill = drill
    if question.save
      redirect_to drill_path(drill)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @drill = @question.drill
  end

  def update
    question = Question.find(params[:id])
    drill = question.drill
    if question.update(question_params)
      redirect_to drill_path(drill)
    else
      render :edit
    end

  end
  
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to drill_path(@question.drill)
    end
  end

  private
  def question_params
    params.permit(:body, :answer, :point, :options => [])
  end
end
