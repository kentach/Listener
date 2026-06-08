class AllowedStudent < ApplicationRecord
  validates :student_id, presence: true, uniqueness: true
  belongs_to :user, foreign_key: :student_id, primary_key: :student_id, optional: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id student_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
