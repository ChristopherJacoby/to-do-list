class TasksController < ApplicationController

  def index
    @tasks = Task.all.where(complete: false)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to new_task_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  def complete
    @task = Task.find(params[:id]).update(complete: true)
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit!
  end

end
