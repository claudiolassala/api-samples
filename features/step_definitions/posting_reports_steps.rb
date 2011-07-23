Given /^a file containing report data$/ do

end

When /^I send a POST request containing the file$/ do
  @login = "some-login"
  post "api/v1/report.xml?login=#{@login}&reportxml=xxx"
end

Then /^the response should be "([^"]*)"$/ do |status|
  last_response.status.should == status.to_i
end

Then /^the report data should be saved$/ do
  submission = ReportSubmission.first
  submission.login.should == @login
end

Then /^the message returned should indicate success$/ do
  last_response.body.should == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<report status=\"SUCCESS\" />\n"
end

