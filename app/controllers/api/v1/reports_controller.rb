class Api::V1::ReportsController < ApplicationController

  respond_to :xml

  def create
    @report_submission = ReportSubmission.create :login => params[:login],
                                                 :status => :success
    respond_with(@report_submission)
  end
end
