class Admin::IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    
    if @issue.save
      redirect_to admin_issues_path
      flash[:success] = "Your issue has been successfully created."
    else
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      redirect_to admin_issues_path
      flash[:success] = "Your issue has been updated."
    else
      render :edit
    end 
  end

  def destroy
    issue = Issue.find(params[:id])
    if issue.destroy
      flash[:notice] = "The issue has been permanently deleted."
    end
    redirect_to admin_issues_path
  end

  private

    def issue_params
      params.require(:issue).permit!
    end
end
