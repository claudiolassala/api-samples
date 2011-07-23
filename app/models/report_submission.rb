class ReportSubmission
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, :type => Symbol
  field :login, :type => String
  field :results, :type => String
end