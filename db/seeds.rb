Favorite.delete_all
LearningRecord.delete_all
Booklist.delete_all
Audio.delete_all
Lesson.delete_all
Textbook.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('textbooks')
ActiveRecord::Base.connection.reset_pk_sequence!('lessons')
ActiveRecord::Base.connection.reset_pk_sequence!('audios')

ActiveRecord::Base.transaction do
  textbooks = [
    { name: "5ステージLEVEL4", series: "5ステージ", level: "英検準2級", image: "textbook4.png" },
    { name: "5ステージLEVEL3", series: "5ステージ", level: "英検3級", image: "textbook3.png" },
    { name: "5ステージLEVEL2", series: "5ステージ", level: "英検4級", image: "textbook2.png" },
    { name: "5ステージLEVEL1", series: "5ステージ", level: "英検5級", image: "textbook1.png" },
    { name: "英語耳ステップ4", series: "英語耳", level: "英検準2級", image: "STEP4.png" },
    { name: "英語耳ステップ3", series: "英語耳", level: "英検3級", image: "STEP3.png" },
    { name: "英語耳ステップ2", series: "英語耳", level: "英検4級", image: "STEP2.png" },
    { name: "英語耳ステップ1", series: "英語耳", level: "英検5級", image: "STEP1.png" }
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
        file_name: "topic1.mp3",
        ja_script: "「こんにちは、みなさん。私の名前は山田ケンタです。私は11歳です。私はサッカーをすることが好きです。好きな教科は英語です。将来はエンジニアになりたいです。ありがとうございました。」",
        en_script: "Hello everyone. My name is Yamada Kenta. I'm 11 years old. I like playing soccer. My favorite subject is English. I want to be an engineer in the future. Thank you."
      },
      {
        title: "TOPIC2",
        file_name: "topic2.mp3",
        ja_script: "「私はスポーツが大好きです。私はサッカーとバスケットボールをします。放課後によく友達と遊びます。体を動かすことが好きです。あなたはどんなスポーツが好きですか？」",
        en_script: "I love sports. I play soccer and basketball. I often play with my friends after school. I like being active. What sports do you like?"
      },
      {
        title: "TOPIC3",
        file_name: "topic3.mp3",
        ja_script: "「私にはアメリカ人の友達がいます。彼の名前はジョンです。彼はニューヨークに住んでいます。彼は音楽がとても好きで、長い髪をしています。彼はギターをとても上手に弾きます。彼のお母さんはピアノの先生です。お母さんもとても上手に歌います。彼女の声は美しいです。彼らは週末に裏庭で家族コンサートを開きます。たくさんの人が来て、彼らの音楽を楽しみます。」",
        en_script: "I have an American friend. His name is John. He lives in New York. He likes music very much, and he has long hair. He plays the guitar very well. His mother is a piano teacher. She sings very well, too. Her voice is beautiful. They have a family concert in their backyard on weekends. Many people come and enjoy their music."
      }
    ]
  },

  {
    learning_mode: "listening",
    title: "Scene1",
    audio_files: [
      { title: "SCENE1", file_name: "scene1.mp3", ja_script: "みなさん、おはようございます。今日は金曜日です。午前中に英語の授業がありますので、英語の教科書を持ってきてください。よろしくお願いします。 \n【質問】：生徒たちは何を持ってくるべきですか。", en_script: "Good morning, everyone. Today is Friday. We have English class in the morning. Please bring your English book. Thank you.\n【Question】What should the students bring?" },
      { title: "SCENE2", file_name: "scene2.mp3", ja_script: "もしもし、ケン。トムだよ。今日はあなたとサッカーをすることができなくなった。放課後に音楽のレッスンがあるから。また明日会おうね。\n【質問】：なぜトムは今日サッカーができないのですか？", en_script: "Hello, Ken. This is Tom. I can't play soccer with you today. I have a music lesson after school. See you tomorrow.\n【Question】Why can't Tom play soccer today?" },
      { title: "SCENE3", file_name: "scene3.mp3", ja_script: "もしもし、エマ。リサです。お誕生日パーティーに招待してくれてありがとう。とてもうれしいです。パーティーは土曜日の2時からですよね。あなたのために小さなプレゼントを持って行きます。土曜日に会いましょう。じゃあね。\n【質問】：リサはパーティーに何を持って行きますか？", en_script: "Hello, Emma. This is Lisa. Thank you for inviting me to your birthday party. I'm very happy. The party starts at two o'clock on Saturday, right? I will bring a small present for you. See you on Saturday. Bye.\n【Question】What will Lisa bring to the party?" },
      { title: "SCENE4", file_name: "scene4.mp3", ja_script: "もしもし、マイク。ジャックだよ。今度の日曜日は暇？家族と一緒に動物園へ行く予定で。マイクが動物好きだよね、一緒に来ない？午前10時に家を出るからね。またあとで電話してね。じゃあね。\n【質問】：ジャックは日曜日にどこへ行きますか？", en_script: "Hello, Mike. This is Jack. Are you free this Sunday? My family and I are going to the zoo. I know you like animals, so would you like to come with us? We will leave home at ten o'clock in the morning. Please call me later. Bye.\n【Question】Where is Jack going on Sunday?" }
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

user = User.find_or_initialize_by(student_id: "saitama3181")
user.password = "saitama3181"
user.password_confirmation = "saitama3181"
user.name = "埼玉太郎"
user.eiken_level = "英検5級"

