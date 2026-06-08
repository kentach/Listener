ActiveAdmin.register AllowedStudent do
  permit_params :student_id  # 追加・編集を許可するカラム

  index do
    selectable_column
    id_column
    column :student_id
    column :名前 do |allowed_student|
      allowed_student.user&.name  # Userのnameを表示
    end
    column :英検レベル do |allowed_student|
      allowed_student.user&.eiken_level
    end
    column :登録済み do |allowed_student|
      allowed_student.user.present? ? "✅" : "未登録"
    end
    column :created_at
    actions
  end
  filter :student_id

  form do |f|
    f.inputs do
      f.input :student_id
    end
    f.actions
  end

  show do
    attributes_table do
      row :student_id
      row :名前 do |allowed_student|
        allowed_student.user&.name
      end
      row :英検レベル do |allowed_student|
        allowed_student.user&.eiken_level
      end
      row :created_at
    end
  end
end
