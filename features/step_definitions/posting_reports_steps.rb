Given /^a file containing report data$/ do

end

When /^I send a POST request containing the file$/ do
  @login = "some-login"
  @file_path = "#{::Rails.root.to_s}/features/step_definitions/test_report.xml"

  post "api/v1/report.xml?login=#{@login}",
       :reportxml => Rack::Test::UploadedFile.new(@file_path, 'text/xml')
end

Then /^the response should be "([^"]*)"$/ do |status|
  last_response.status.should == status.to_i
end

Then /^the report data should be saved$/ do
  submission = ReportSubmission.first
  submission.status.should == :success
  submission.login.should == @login
  submission.results.should == File.read(@file_path)
end

Then /^the message returned should indicate success$/ do
  last_response.body.should == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<report status=\"SUCCESS\" />"
end
