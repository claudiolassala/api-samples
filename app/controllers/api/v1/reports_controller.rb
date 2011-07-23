class Api::V1::ReportsController < ApplicationController

  respond_to :xml

  def create

    @report_submission = ReportSubmission.create :login => params[:login],
                                                 :status => :success,
                                                 :results => read_file_data(params[:reportxml])
    respond_with(@report_submission)
  end

  private
    def read_file_data(file)
      xml_contents = ""
      if file.respond_to?(:read)
        xml_contents = file.read
      elsif file.respond_to?(:path)
        xml_contents = File.read(file.path)
      else
        logger.error "Bad file_data: #{file.class.name}: #{file.inspect}"
      end
      xml_contents
    end
end
