class JobsController < ApplicationController
  # load_and_authorize_resource

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to(jobs_path)
    else
      render 'new'
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    redirect_to job_path(@job)
    return
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end



  private
    def job_params
      params.require(:job).permit(:title, :description)
    end

end
