Feature: Posting reports

  In order to submit a report
  As an API client
  I want to have an API where I can post the file containing the report results

Scenario: Posting

  Given a file containing report data
  When I send a POST request containing the file
  Then the response should be "200"
   And the report data should be saved
   And the message returned should indicate success
