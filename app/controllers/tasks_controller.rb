class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@tasks = current_user.tasks
	end

	# GET with blank form
	def new
		@task = Task.new    
	end

	def show
	end

	def edit
	end

	# POST to save task in database
	def create
		@task = current_user.tasks.new(task_params)

		if @task.save
			redirect_to tasks_path
		else
			render :new
		end
	end

	def update
		if @task.update(task_params)
			redirect_to tasks_path
		else
			render :edit
		end
	end

	def destroy
		@task.destroy
		redirect_to tasks_path
	end
	
	private
		def task_params
			params.require(:task).permit(:title, :description)
		end

		def set_task
			@task = Task.find(params[:id])
		end
end
