ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: "管理画面" do

    columns do
      column do
        panel "生徒数" do
          para "登録済み生徒: #{User.count}人"
          para "許可ID数: #{AllowedStudent.count}件"
          para "未登録ID数: #{AllowedStudent.count - User.count}件"
        end
      end

      column do
        panel "最近登録した生徒" do
          table_for User.order(created_at: :desc).limit(5) do
            column :student_id
            column :name
            column :eiken_level
            column :created_at
          end
        end
      end
    end

  end
end