Favorite.delete_all
LearningRecord.delete_all
Booklist.delete_all
Audio.delete_all
Lesson.delete_all
Textbook.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('textbooks')

ActiveRecord::Base.transaction do
  textbooks = [
    { name: "5ステージLEVEL4", series: "5ステージ", level: "英検準1級", image: "textbook4.png" },
    { name: "5ステージLEVEL3", series: "5ステージ", level: "英検2級", image: "textbook3.png" },
    { name: "5ステージLEVEL2", series: "5ステージ", level: "英検準2級", image: "textbook2.png" },
    { name: "5ステージLEVEL1", series: "5ステージ", level: "英検3級", image: "textbook1.png" }

  ]

  textbooks.each do |attrs|
    Textbook.create!(attrs)
  end

  def create_lessons_for(textbook_name, lesson_data)
    textbook = Textbook.find_by!(name: textbook_name)
    lesson_data.each do |data|
      lesson = textbook.lessons.create!(
        learning_mode: data[:learning_mode],
        title: data[:title]
      )
      Array(data[:audio_files]).each do |audio|
        lesson.audios.create!(
            title: audio[:title],
            file_name: audio[:file_name],
            ja_script: audio[:ja_script],
            en_script: audio[:en_script]
          # ここに保存したいカラムを書くこと。
        )
      end
    end
  end

  lesson_data1 = [
  {
    learning_mode: "reading",
    title: "TOPIC1",
    audio_files: [
      {
        title: "TOPIC1",
        file_name: "#",
        ja_script: "こんにちは、みなさん。私の名前は山田ケンタです。私は11歳です。私はサッカーをすることが好きです。好きな教科は英語です。将来はエンジニアになりたいです。ありがとうございました。",
        en_script: "Hello everyone. My name is Yamada Kenta. I'm 11 years old. I like playing soccer. My favorite subject is English. I want to be an engineer in the future. Thank you."
      },
      {
        title: "TOPIC2",
        file_name: "#",
        ja_script: "私はスポーツが大好きです。私はサッカーとバスケットボールをします。放課後によく友達と遊びます。体を動かすことが好きです。あなたはどんなスポーツが好きですか？",
        en_script: "I love sports. I play soccer and basketball. I often play with my friends after school. I like being active. What sports do you like?"
      }
    ]
  }
]
  create_lessons_for("5ステージLEVEL1", lesson_data1)
end

AdminUser.find_or_create_by(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end

AllowedStudent.find_or_create_by(student_id: "saitama3181")

User.find_or_create_by(student_id: "saitama3181") do |user|
  user.password = "saitama3181"
  user.password_confirmation = "saitama3181"
  user.name = "埼玉太郎"
  user.eiken_level = "英検5級"
end
