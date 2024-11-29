require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Biology", with: @student.biology
    fill_in "Chemical", with: @student.chemical
    fill_in "Civic education", with: @student.civic_education
    fill_in "English", with: @student.english
    fill_in "Geography", with: @student.geography
    fill_in "History", with: @student.history
    fill_in "Language", with: @student.language_id
    fill_in "Literature", with: @student.literature
    fill_in "Math", with: @student.math
    fill_in "Physics", with: @student.physics
    fill_in "Student", with: @student.student_id
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Biology", with: @student.biology
    fill_in "Chemical", with: @student.chemical
    fill_in "Civic education", with: @student.civic_education
    fill_in "English", with: @student.english
    fill_in "Geography", with: @student.geography
    fill_in "History", with: @student.history
    fill_in "Language", with: @student.language_id
    fill_in "Literature", with: @student.literature
    fill_in "Math", with: @student.math
    fill_in "Physics", with: @student.physics
    fill_in "Student", with: @student.student_id
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
