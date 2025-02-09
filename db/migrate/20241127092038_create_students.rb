class CreateStudents < ActiveRecord::Migration[6.0] # Hoặc phiên bản phù hợp
  def change
    create_table :students, id: false do |t| # Sử dụng id: false nếu không muốn trường id mặc định
      t.string :student_id, primary_key: true # Đặt student_id là khóa chính
      t.float :math, default: 0
      t.float :literature, default: 0
      t.float :english, default: 0
      t.float :physics, default: 0
      t.float :chemical, default: 0
      t.float :biology, default: 0
      t.float :history, default: 0
      t.float :geography, default: 0
      t.float :civic_education, default: 0
      t.string :language_id

      t.timestamps # Tạo các cột created_at và updated_at
    end
  end
end
