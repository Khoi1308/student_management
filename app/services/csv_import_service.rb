class CsvImportService
  require 'csv'

  def initialize(file)
    @file = file
    @count = 0
  end

  def import
    @count = 0
    batch_size = 200_000 # Số lượng bản ghi nhập mỗi lần
    students_batch = []

    CSV.foreach(@file.path, headers: true).each_with_index do |row, index|
      student_data = {
        student_id: row['sbd'],
        math: row['toan'].to_f,
        literature: row['ngu_van'].to_f,
        english: row['ngoai_ngu'].to_f,
        physics: row['vat_li'].to_f,
        chemical: row['hoa_hoc'].to_f,
        biology: row['sinh_hoc'].to_f,
        history: row['lich_su'].to_f,
        geography: row['dia_li'].to_f,
        civic_education: row['gdcd'].to_f,
        language_id: row['ma_ngoai_ngu']
      }

      students_batch << student_data

      next unless students_batch.size >= batch_size

      Student.import students_batch,
                     on_duplicate_key_update: { conflict_target: [:student_id],
                                                columns: %i[math literature english physics chemical biology history
                                                            geography civic_education language_id] }
      @count += students_batch.size
      students_batch.clear # Xóa batch sau khi đã nhập
    end

    # Nếu còn bản ghi nào chưa được nhập, tiếp tục nhập
    unless students_batch.empty?
      Student.import students_batch,
                     on_duplicate_key_update: { conflict_target: [:student_id],
                                                columns: %i[math literature english physics chemical biology history geography civic_education
                                                            language_id] }
    end
    @count += students_batch.size

    refresh_statistics
  end

  def number_imported_with_last_run
    @count
  end

  def refresh_statistics
    DataService.new.refresh_statistics
  end
end
