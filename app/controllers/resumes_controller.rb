class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      flash[:notice] = "Upload Success!"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to :back
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :attachment, :content)
  end

end
