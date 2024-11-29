class DashboardsController < ApplicationController
  def index
    subjects = %i[math literature english physics chemical biology history geography civic_education]

    @stats = {}

    subjects.each do |subject|
      @stats[subject] = Student.classify_scores(subject)
    end
  end
end
