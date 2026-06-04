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
        ja_script: "こんにちは、みなさん。私の名前は山田ケンタです。私の誕生日は1月7日です。私は11歳です。私の好きな色は青です。好きな食べ物はハンバーグです。ありがとうございました。",
        en_script: "Hello everyone, my name is Yamada Kenta. My birthday is January 7th. I'm 11 years old.  My favorite color is blue. My favorite food is hamburger steak. Thank you."
      },
      {
        title: "TOPIC2",
        file_name: "ontre_1dan/TOPIC2.mp3",
        ja_script: "私はスポーツが大好きです。サッカー、テニス、バドミントンをします。私は毎週日曜日に公園で走ります。あなたもスポーツは好きですか？
        いいえ、好きではありません。私は本が大好きです。部屋にたくさん本があります。小説や雑誌を読みます。漫画は読みません。",
        en_script: "I like sports very much. I play soccer tennis and badminton. I run in the park every Sunday. Do you like sports, too?
        No, I don't. I love books. I have many books in my room. I read novels and magazines. I don't read comic books."
      },
      {
        title: "TOPIC3",
        file_name: "ontre_1dan/TOPIC3.mp3",
        ja_script: "すみません、次のショーは何時ですか？ 5時30分です。 わかりました。いくらですか？ 5ドルです。 チケットは何枚必要ですか？  2枚お願いします。
                     どの席がいいですか？前ですか、後ろですか？ 前でお願いします。 はい、どうぞ。10ドルです。 ありがとうございます。トイレはどこですか？     あちらです。",
      en_script: "Excuse me, what time is the next show?  It's at 5:30.  Okay. How much is it? It's 5 dollars. How many tickets do you want? 2 tickets, please.
                   Which seats do you want, front or back? Front, please.  Okay. Here you are. It's 10 dollars. Thank you. And where is the restroom? It's over there. ",

      },
      {
        title: "TOPIC4",
        file_name: "ontre_1dan/TOPIC4.mp3",
        ja_script: "「私にはアメリカ人の友達がいます。彼の名前はジョンです。彼はニューヨークに住んでいます。彼は音楽がとても好きで、長い髪をしています。彼はギターをとても上手に弾きます。彼のお母さんはピアノの先生です。お母さんもとても上手に歌います。彼女の声は美しいです。彼らは週末に裏庭で家族コンサートを開きます。たくさんの人が来て、彼らの音楽を楽しみます。」",
        en_script: "I have an American friend. His name is John. He lives in New York.  He likes music very much, and he has long hair. He plays the guitar very well. 
                     His mother is a piano teacher. She sings very well, too. Her voice is beautiful. 
                     They have a family concert in their backyard on weekends. Many people come and enjoy their music."
      },
      {
        title: "TOPIC5",
        file_name: "ontre_1dan/TOPIC5.mp3",
        ja_script: "「ボブ、家ではいつも何をしているの？」 「だいたい4時ごろに家に帰るよ。いつもまず宿題をするんだ。」 「わあ、それはいいね。お兄さん（弟さん）はどうなの？」 「兄はいつも帰りが遅いんだ。いつも忙しくて疲れているよ。僕たちは一緒に夕食を食べることが全然ないんだ。」 \n「週末はお兄さん（弟さん）と何をするの？」 \n「よく公園でサッカーをするよ。時々テニスもするんだ。」 \n「いいね。今週末はいっしょにテニスをしようよ。」",
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
      { title: "SCENE1 No1", file_name: "ontre_1dan/音トレ初段SCENE1_No1.mp3", ja_script: "メアリー、あなたの誕生日は7月ですか？ いいえ、6月です。 質問：メアリーの誕生日はいつですか？", en_script:"Is your birthday in July, Mary? No, it's in June. \n 【Question】: When is Mary7s birthday?"},
      { title: "SCENE1 No2", file_name: "ontre_1dan/音トレ初段SCENE1_No2.mp3", ja_script:"ジョージ、あなたの家族は何人ですか？ 母、父、姉（妹）、そして私です。 質問：ジョージの家族は何人ですか？", en_script:"How many people are there in your family, George? \n My mom, my dad, my sister and me.\n 【Question】: How many people are there in George's family?"},
      { title: "SCENE1 No3", file_name: "ontre_1dan/音トレ初段SCENE1_No3.mp3", ja_script:"メグ、あなたはにんじんが好きですか？ いいえ、好きではありません。 私はトマトが好きです。 質問：メグはどんな野菜が好きですか？", en_script:"Do you like carrots, Meg? No, I don't. \n I like tomato. \n 【Question】:  What vegetables does Meg like?" },
      { title: "SCENE1 No4", file_name: "ontre_1dan/音トレ初段SCENE1_No4.mp3", ja_script:"ショウゴ、あなたはどこの出身ですか？ 大阪出身ですが、今は東京に住んでいます。 質問：ショウゴは今どこに住んでいますか？", en_script:"Where are you from, Shogo? \nI'm from Osaka, but now I live in Tokyo. \n 【Question】: Where does Shogo live now?" },
      { title: "SCENE1 Q1", file_name: "ontre_1dan/音トレ初段SCENE1_Q1.mp3", ja_script:"こんにちは、ジェーン。今日は元気ですか？ 1. 元気です、ありがとう。 2. あなたもね。 3. 自転車で。", en_script:"Hi Jane. How are you today? \n1. Fine, thanks. \n2. You, too. \n3. By bike." },
      { title: "SCENE1 Q2", file_name: "ontre_1dan/音トレ初段SCENE1_Q2.mp3", ja_script:"ジョンはシドニー出身ですか？ 1. 彼は親切です。 2. 彼はサッカーをします。 3. はい、そうです。", en_script:"Is John from Sydney? \n1. He's kind. \n2. He plays soccer. \n3. Yes, he is." },
      { title: "SCENE1 Q3", file_name: "ontre_1dan/音トレ初段SCENE1_Q3.mp3", ja_script:"あなたはバスケットボールが好きですか？ 1. はい、とても楽しいスポーツです。 2. 4月16日です。 3. いいえ、それは公園にあります。", en_script:"Do you like basketball? \n1. Yes, it's a fun sport. \n2. on April 16th. \n3. No, it's in the park." },
      { title: "SCENE1 Q4", file_name: "ontre_1dan/音トレ初段SCENE1_Q4.mp3", ja_script:"テッド、あなたには兄弟がいますか？ 1. 私はテニスをします。 2. いいえ、でも姉（妹）が1人います。 3. 私は猫を3匹飼っています。", en_script:"Do you have brothers, Ted? \n1. I play tennis. \n2. No, but I have one sister. \n3. I have three cats." },
      { title: "SCENE1 Q5", file_name: "ontre_1dan/音トレ初段SCENE1_Q5.mp3", ja_script:"ブラウンさん、ごちそうさまでした。 1. 私は30歳です。 2. 私は夕食を作りません。 3. どういたしまして。", en_script:"Thank you for the dinner, Mr. Brown. \n1. I'm 30 years old. \n2. I don't cook dinner. \n3. You're welcome." },
      { title: "SCENE1 Q6", file_name: "ontre_1dan/音トレ初段SCENE1_Q6.mp3", ja_script:"ポール、あなたは何の教科が好きですか？ 1. 緑色が好きです。 2. 理科です。 3. それは私の教科書です。", en_script:"What subject do you like, Paul? \n1. I like green. \n2. Science. \n3. It's my textbook" },
      { title: "SCENE1 Q7", file_name: "ontre_1dan/音トレ初段SCENE1_Q7.mp3", ja_script:"ナンシー、あなたの誕生日はいつですか？ 1. ケーキが欲しいです。 2. 私は11歳です。 3. 9月です。", en_script:"When's your birthday, Nancy?  \n1. I want a cake. \n2. I'm 11. \n3. It's in September." },
      { title: "SCENE1 Q8", file_name: "ontre_1dan/音トレ初段SCENE1_Q8.mp3", ja_script:"よい休暇を過ごしてね、トム。 1. ありがとう、ベス。あなたもね。 2. こんばんは、ベス。 3. どういたしまして。", en_script:"Have a nice vacation, Tom. \n1. Thank you Beth, you too. \n2. Good evening, Beth. \n3. You're welcome." }
    ]
  }
]
  create_lessons_for("音トレ道場初段", lesson_data1)
end