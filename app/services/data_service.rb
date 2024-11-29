class DataService
  def generate_statistics
    sql = <<-SQL
      CREATE MATERIALIZED VIEW IF NOT EXISTS classified_scores AS
      SELECT
        student_id,
        CASE
          WHEN math >= 8 THEN '>= 8'
          WHEN math >= 6 THEN '6 - 8'
          WHEN math >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS math_classification,
        CASE
          WHEN literature >= 8 THEN '>= 8'
          WHEN literature >= 6 THEN '6 - 8'
          WHEN literature >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS literature_classification,
        CASE
          WHEN english >= 8 THEN '>= 8'
          WHEN english >= 6 THEN '6 - 8'
          WHEN english >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS english_classification,
        CASE
          WHEN physics >= 8 THEN '>= 8'
          WHEN physics >= 6 THEN '6 - 8'
          WHEN physics >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS physics_classification,
        CASE
          WHEN chemical >= 8 THEN '>= 8'
          WHEN chemical >= 6 THEN '6 - 8'
          WHEN chemical >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS chemical_classification,
        CASE
          WHEN biology >= 8 THEN '>= 8'
          WHEN biology >= 6 THEN '6 - 8'
          WHEN biology >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS biology_classification,
        CASE
          WHEN history >= 8 THEN '>= 8'
          WHEN history >= 6 THEN '6 - 8'
          WHEN history >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS history_classification,
        CASE
          WHEN geography >= 8 THEN '>= 8'
          WHEN geography >= 6 THEN '6 - 8'
          WHEN geography >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS geography_classification,
        CASE
          WHEN civic_education >= 8 THEN '>= 8'
          WHEN civic_education >= 6 THEN '6 - 8'
          WHEN civic_education >= 4 THEN '4 - 6'
          ELSE '< 4'
        END AS civic_education_classification
      FROM students;
    SQL

    ActiveRecord::Base.connection.execute(sql)
  end

  def refresh_statistics
    sql = 'REFRESH MATERIALIZED VIEW classified_scores'
    ActiveRecord::Base.connection.execute(sql)
  end
end
