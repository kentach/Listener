Favorite.delete_all
LearningRecord.delete_all
Booklist.delete_all
Audio.delete_all
Lesson.delete_all
Textbook.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('textbooks')

ActiveRecord::Base.transaction do
  textbooks = [
    { name: "音トレ道場6段", series: "音トレ", level: "英検準1級", image: "ontra_step6.png" },
    { name: "音トレ道場5段", series: "音トレ", level: "英検2級", image: "ontra_step5.png" },
    { name: "音トレ道場4段", series: "音トレ", level: "英検準2級", image: "ontra_step4.png" },
    { name: "音トレ道場3段", series: "音トレ", level: "英検3級", image: "ontra_step3.png" },
    { name: "音トレ道場2段", series: "音トレ", level: "英検4級", image: "ontra_step2.png" },
    { name: "音トレ道場初段", series: "音トレ", level: "英検5級", image: "ontra_beginner.png" },

    { name: "リズムでマスター英検準1級", series: "リズマス", level: "英検準1級", image: "rhythmas_pre1.png" },
    { name: "リズムでマスター英検2級", series: "リズマス", level: "英検2級", image: "rhythmas_step2.png" },
    { name: "リズムでマスター英検準2級", series: "リズマス", level: "英検準2級", image: "rhythmas_pre2.png" },
    { name: "リズムでマスター英検3級", series: "リズマス", level: "英検3級", image: "rhythmas_step3.png" },
    { name: "リズムでマスター英検4級", series: "リズマス", level: "英検4級", image: "rhythmas_step4.png" },
    { name: "リズムでマスター英検5級", series: "リズマス", level: "英検5級", image: "rhythmas_step5.png" },
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
          #ここに保存したいカラムを書くこと。
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
        file_name: "ontre_1dan/TOPIC1.mp3",
        ja_script: "こんにちは、みなさん。私の名前は山田ケンタです。\n私の誕生日は1月7日です。\n私は11歳です。\n私の好きな色は青です。\n好きな食べ物はハンバーグです。\nありがとうございました。",
        en_script: "Hello everyone, my name is Yamada Kenta. My birthday is January 7th. I'm 11 years old.  My favorite color is blue. My favorite food is hamburger steak. Thank you."
      },
      {
        title: "TOPIC2",
        file_name: "ontre_1dan/TOPIC2.mp3",
        ja_script: "私はスポーツが大好きです。\nサッカー、テニス、バドミントンをします。\n私は毎週日曜日に公園で走ります。\nあなたもスポーツは好きですか？
        \nいいえ、好きではありません。\n私は本が大好きです。\n部屋にたくさん本があります。\n小説や雑誌を読みます。\n漫画は読みません。",
        en_script: "I like sports very much. I play soccer tennis and badminton. I run in the park every Sunday. Do you like sports, too?
        No, I don't. I love books. I have many books in my room. I read novels and magazines. I don't read comic books."
      },
      {
        title: "TOPIC3",
        file_name: "ontre_1dan/TOPIC3.mp3",
        ja_script: "すみません、次のショーは何時ですか？\n5時30分です。\nわかりました。いくらですか？\n5ドルです。\nチケットは何枚必要ですか？ \n2枚お願いします。
                    \nどの席がいいですか？前ですか、後ろですか？\n前でお願いします。\nはい、どうぞ。10ドルです。\nありがとうございます。トイレはどこですか？    \nあちらです。",
      en_script: "Excuse me, what time is the next show?  It's at 5:30.  Okay. How much is it? It's 5 dollars. How many tickets do you want? 2 tickets, please.
                   Which seats do you want, font or back? Front, please.  Okay. Here you are. It's 10 dollars. Thank you. And where is the restroom? It's over there. ",

      },
      {
        title: "TOPIC4",
        file_name: "ontre_1dan/TOPIC4.mp3",
        ja_script: "「私にはアメリカ人の友達がいます。彼の名前はジョンです。彼はニューヨークに住んでいます。\n彼は音楽がとても好きで、長い髪をしています。彼はギターをとても上手に弾きます。\n彼のお母さんはピアノの先生です。お母さんもとても上手に歌います。彼女の声は美しいです。\n彼らは週末に裏庭で家族コンサートを開きます。たくさんの人が来て、彼らの音楽を楽しみます。」",
        en_script: "I have an American friend. His name is John. He lives in New York.  He likes music very much, and he has long hair. He plays the guitar very well. 
                     His mother is a piano teacher. She sings very well, too. Her voice is beautiful. 
                     They have a family concert in their backyard on weekends. Many people come and enjoy their music."
      },
      {
        title: "TOPIC5",
        file_name: "ontre_1dan/TOPIC5.mp3",
        ja_script: "「ボブ、家ではいつも何をしているの？」 \n「だいたい4時ごろに家に帰るよ。いつもまず宿題をするんだ。」 \n「わあ、それはいいね。お兄さん（弟さん）はどうなの？」 \n「兄はいつも帰りが遅いんだ。いつも忙しくて疲れているよ。僕たちは一緒に夕食を食べることが全然ないんだ。」 \n「週末はお兄さん（弟さん）と何をするの？」 \n「よく公園でサッカーをするよ。時々テニスもするんだ。」 \n「いいね。今週末はいっしょにテニスをしようよ。」",
        en_script: "What do you usually do at home, Bob?  I usually get home at around 4. I always do my homework first.
                     Wow. That’s good. How about your brother? He always comes home late. He’s always busy and tired. We never eat dinner together.
                     What do you do with your brother on weekends?  We often play soccer in the park. We sometimes play tennis.
                     Great. Let’s play tennis together this weekend."
      },
      {
        title: "TOPIC6",
        file_name: "ontre_1dan/TOPIC6.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC7",
        file_name: "ontre_1dan/TOPIC7.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC8",
        file_name: "ontre_1dan/TOPIC8.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC9",
        file_name: "ontre_1dan/TOPIC9.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC10",
        file_name: "ontre_1dan/TOPIC10.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC11",
        file_name: "ontre_1dan/TOPIC11.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC12",
        file_name: "ontre_1dan/TOPIC12.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC13",
        file_name: "ontre_1dan/TOPIC13.mp3",
        ja_script:"#",
        en_script:"#"
      },
      {
        title: "TOPIC14",
        file_name: "ontre_1dan/TOPIC14.mp3",
        ja_script:"#",
        en_script:"#"
      }
    ]
  },

  {
    learning_mode: "listening",
    title: "Scene1",
    audio_files: [
      { title: "SCENE1 No1", file_name: "ontre_1dan/音トレ初段SCENE1_No1.mp3", ja_script:"#", en_script:"#"},
      { title: "SCENE1 No2", file_name: "ontre_1dan/音トレ初段SCENE1_No2.mp3", ja_script:"#", en_script:"#"},
      { title: "SCENE1 No3", file_name: "ontre_1dan/音トレ初段SCENE1_No3.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 No4", file_name: "ontre_1dan/音トレ初段SCENE1_No4.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q1", file_name: "ontre_1dan/音トレ初段SCENE1_Q1.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q2", file_name: "ontre_1dan/音トレ初段SCENE1_Q2.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q3", file_name: "ontre_1dan/音トレ初段SCENE1_Q3.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q4", file_name: "ontre_1dan/音トレ初段SCENE1_Q4.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q5", file_name: "ontre_1dan/音トレ初段SCENE1_Q5.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q6", file_name: "ontre_1dan/音トレ初段SCENE1_Q6.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q7", file_name: "ontre_1dan/音トレ初段SCENE1_Q7.mp3", ja_script:"#", en_script:"#" },
      { title: "SCENE1 Q8", file_name: "ontre_1dan/音トレ初段SCENE1_Q8.mp3", ja_script:"#", en_script:"#" }
    ]
  }
]
  create_lessons_for("音トレ道場初段", lesson_data1)
end