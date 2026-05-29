crumb :textbooks_all do |textbook|
  link "教材一覧", root_path
end

                  # do |引数|
crumb :textbook do |textbook|
  link textbook.name, textbook_path(textbook)
  #link リンク名, pathを書く

  parent :textbooks_all, textbook
  #parent :親の名前, 親に渡すデータ
end

crumb :audios do |lesson|
  link "#{lesson.learning_mode}", textbook_lesson_path(lesson.textbook, lesson.learning_mode) #必ず引数のlessonに合わせること。
  parent :textbook, lesson.textbook
end


crumb :script do |audio|
  link '音声スクリプト', textbook_lesson_audio_path(audio.lesson.textbook, audio.lesson.learning_mode, audio)
  parent :audios, audio.lesson.textbook
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).