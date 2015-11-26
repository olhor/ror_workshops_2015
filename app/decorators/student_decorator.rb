class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes
    return '0.00' if notes.blank?
    sum = subject_item.subject_item_notes.collect(&:value).sum(&:to_f)
    format '%.2f', sum / notes.length
  end
end
