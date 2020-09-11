class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end

		# GET with blank form
    def new
      @task = Task.new    
    end

    # POST to save task in database
    def create
			@task = Task.new(task_params)
			if @task.save
				redirect_to tasks_path
			else
				render :new
			end
		end
		
		private
			def task_params
				params.require(:task).permit(:title, :description)
			end
end