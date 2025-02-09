class Student < ApplicationRecord
  paginates_per 10

  def self.ransackable_attributes(_auth_object = nil)
    ['student_id']
  end

  def self.classify_scores(subject)
    classified_scores = ActiveRecord::Base.connection.execute("
      SELECT #{subject}_classification, COUNT(*) AS COUNT
      FROM classified_scores
      GROUP BY #{subject}_classification
    ")

    result = {}

    classified_scores.each do |row|
      result[row["#{subject}_classification"]] = row['count']
    end

    result
  end
end
