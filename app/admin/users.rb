ActiveAdmin.register User do
  permit_params :name, :eiken_level, :student_id

  index do
    selectable_column
    id_column
    column :student_id
    column :name
    column :eiken_level
    column :created_at
    actions
  end

  filter :student_id
  filter :name
  filter :eiken_level

  form do |f|
    f.inputs do
      f.input :student_id
      f.input :name
      f.input :eiken_level
    end
    f.actions
  end

  show do
    attributes_table do
      row :student_id
      row :name
      row :eiken_level
      row :created_at
    end
  end
end
