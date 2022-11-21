class TasksController < ApplicationController

  def index
    @tasks = Task.where(complete: false)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to new_task_path, notice: "Task has been created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  # PUT tasks/123?completed=true
  def update
    #=> params[:completed] => true
    @task = Task.find(params[:id])
    @task.update(task_params)
    # another approach: update 'completed' attribute with params[:completed]
    if @task.save
      redirect_to @task, notice: "Task has been updated"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other, alert: "Task has been deleted"
  end

  # Create a new route, wire up the form action to the route
  def complete
    @task = Task.find(params[:id]).update(complete: true)
    redirect_to root_path, notice: "Task has been completed"
  end

  private

  def task_params
    params.require(:task).permit(:name, :room, :assigned, :allowance, :complete)
  end

end

#
# Complete
# Find id of task and get params
# update boolean of complete to true
# route back to root
# display flash of complete
# place complete flash in controller
