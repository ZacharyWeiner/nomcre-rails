class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]
  layout 'adminlte'
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user: current_user)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    @task.completed = true
    respond_to do |format|
      if @task.save
        format.html { redirect_to proposal_path(@task.proposal), notice: 'Task was successfully completed.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      if params[:task_id].nil?
        @task = Task.find(params[:id])
      else
        @task = Task.find(params[:task_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :description, :deadline, :completed)
    end
end
