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
          en_script: audio[:en_script],
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
          ja_script: 'こんにちは、みなさん。私は山田健太です。私の誕生日は1月7日です。
          私は11歳です。好きな色は青です。好きな食べ物はハンバーグステーキです。ありがとうございます。',
          en_script: "Hello, everyone. My name is Yamada Kenta. My birthday is January 7th.
          I'm 11 years old. My favorite color is blue. My favorite food is hamburger steak. Thank you."
        },
        {
          title: "TOPIC2",
          file_name: "ontre_1dan/TOPIC2.mp3",
          ja_script: '私はスポーツがとても好きです。サッカー、テニス、バドミントンをします。
          私は毎週日曜日に公園で走ります。あなたもスポーツは好きですか？いいえ、好きではありません。私は本が大好きです。
          部屋にたくさん本があります。小説や雑誌を読みます。漫画は読みません。',
          en_script: "I like sports very much. I play soccer, tennis and badminton.
          I run in the park every Sunday. Do you like sports, too?
          No, I don't. I love books. I have many books in my room. I read novels and magazines.
          I don't read comic books."
        },
        {
          title: "TOPIC3",
          file_name: "ontre_1dan/TOPIC3.mp3",
          ja_script: 'すみません、次の公演は何時ですか？
          5時30分です。
          
          わかりました。いくらですか？
          5ドルです。
          
          チケットはいくつ欲しいですか？
          2枚ください。
          
          どの席がいいですか？前と後ろ、どちらですか？
          前でお願いします。
          
          はい、どうぞ。10ドルです。ありがとうございます。
          すみません、トイレはどこですか？
          あそこです。',
          en_script: "Excuse me, what time is the next show? It's at 5:30. Okay. How much is it? It's 5 dollars. How tickets
          do you want? Two tickets, please. Which seats do you want, front or back? Front, please. Okay, here you are. It's ten dollars. Thank you.
            Where is the restroom? It's over there."
        },
        {
          title: "TOPIC4",
          file_name: "ontre_1dan/TOPIC4.mp3"
        },
        {
          title: "TOPIC5",
          file_name: "ontre_1dan/TOPIC5.mp3"
        },
        {
          title: "TOPIC6",
          file_name: "ontre_1dan/TOPIC6.mp3"
        },
        {
          title: "TOPIC7",
          file_name: "ontre_1dan/TOPIC7.mp3"
        },
        {
          title: "TOPIC8",
          file_name: "ontre_1dan/TOPIC8.mp3"
        },
        {
          title: "TOPIC9",
          file_name: "ontre_1dan/TOPIC9.mp3"
        },
        {
          title: "TOPIC10",
          file_name: "ontre_1dan/TOPIC10.mp3"
        },
        {
          title: "TOPIC11",
          file_name: "ontre_1dan/TOPIC11.mp3"
        },
        {
          title: "TOPIC12",
          file_name: "ontre_1dan/TOPIC12.mp3"
        },
        {
          title: "TOPIC13",
          file_name: "ontre_1dan/TOPIC13.mp3"
        },
        {
          title: "TOPIC14",
          file_name: "ontre_1dan/TOPIC14.mp3"
        }
      ]
    },
  
    { 
      learning_mode: "listening",
      title: "Scene1",
      audio_files: [
        {
          title: "No1",
          file_name: "ontre_1dan/音トレ初段SCENE1_No1.mp3"
        },
        {
          title: "No2",
          file_name: "ontre_1dan/音トレ初段SCENE1_No2.mp3"
        },
        {
          title: "No3",
          file_name: "ontre_1dan/音トレ初段SCENE1_No3.mp3"
        },
        {
          title: "No4",
          file_name: "ontre_1dan/音トレ初段SCENE1_No4.mp3"
        },
        {
          title: "Q1",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q1.mp3"
        },
        {
          title: "Q2",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q2.mp3"
        },
        {
          title: "Q3",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q3.mp3"
        },
        {
          title: "Q4",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q4.mp3"
        },
        {
          title: "Q5",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q5.mp3"
        },
        {
          title: "Q6",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q6.mp3"
        },
        {
          title: "Q7",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q7.mp3"
        },
        {
          title: "Q8",
          file_name: "ontre_1dan/音トレ初段SCENE1_Q8.mp3"
        }
      ]
    }
  ]
  create_lessons_for("音トレ道場初段", lesson_data1)
end