class TasksController < ApplicationController
  before_action :display, only: [:show, :edit, :update, :destroy]

  def list
    @tasks = Task.all
  end

  def show
    display
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def display
    @task = Task.find(params[:id])
  end
end
