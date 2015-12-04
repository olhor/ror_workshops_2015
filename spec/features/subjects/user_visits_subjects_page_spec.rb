require 'spec_helper'

feature 'User visits report subjects page' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Matura', birthdate: Date.new(1984,9,18) }
  let!(:teacher) { create :teacher, first_name: 'Adam', last_name: 'Asnyk', academic_title: 'Dr.' }
  let!(:subject_item) { create :subject_item, title: 'Matma', teacher: teacher }
  let!(:participant) { create :participation, student: student, subject_item: subject_item }
  let!(:note_1) { create :subject_item_note, value: 5, student: student, subject_item: subject_item }
  let!(:note_2) { create :subject_item_note, value: 4, student: student, subject_item: subject_item }

  background do
    visit report_subjects_path
  end

  scenario 'should see subjects list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Subjects'
    end
    within('.subjects') do
      expect(page).to have_content 'list of subjects:'
      expect(page).to have_content 'Jan Matura'
      expect(page).to have_content 'Matma'
      expect(page).to have_content 'Adam Asnyk'
      expect(page).to have_content '4.50'
      expect(page).to have_content '1984-09_18'
    end
  end
end
