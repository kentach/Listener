
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
          file_name: audio[:file_name]
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
          file_name: "TOPIC1.mp3"
        },
        {
          title: "TOPIC2",
          file_name: "TOPIC2.mp3"
        },
        {
          title: "TOPIC3",
          file_name: "TOPIC3.mp3"
        },
        {
          title: "TOPIC4",
          file_name: "TOPIC4.mp3"
        },
        {
          title: "TOPIC5",
          file_name: "TOPIC5.mp3"
        },
        {
          title: "TOPIC6",
          file_name: "TOPIC6.mp3"
        },
        {
          title: "TOPIC7",
          file_name: "TOPIC7.mp3"
        },
        {
          title: "TOPIC8",
          file_name: "TOPIC8.mp3"
        },
        {
          title: "TOPIC9",
          file_name: "TOPIC9.mp3"
        },
        {
          title: "TOPIC10",
          file_name: "TOPIC10.mp3"
        },
        {
          title: "TOPIC11",
          file_name: "TOPIC11.mp3"
        },
        {
          title: "TOPIC12",
          file_name: "TOPIC12.mp3"
        },
        {
          title: "TOPIC13",
          file_name: "TOPIC13.mp3"
        },
        {
          title: "TOPIC14",
          file_name: "TOPIC14.mp3"
        }
      ]
    },
  
    { 
      learning_mode: "listening",
      title: "Scene1",
      audio_files: [
        {
          title: "No1",
          file_name: "音トレ初段SCENE1_No1.mp3"
        },
        {
          title: "No2",
          file_name: "音トレ初段SCENE1_No2.mp3"
        },
        {
          title: "No3",
          file_name: "音トレ初段SCENE1_No3.mp3"
        },
        {
          title: "No4",
          file_name: "音トレ初段SCENE1_No4.mp3"
        },
        {
          title: "Q1",
          file_name: "音トレ初段SCENE1_Q1.mp3"
        },
        {
          title: "Q2",
          file_name: "音トレ初段SCENE1_Q2.mp3"
        },
        {
          title: "Q3",
          file_name: "音トレ初段SCENE1_Q3.mp3"
        },
        {
          title: "Q4",
          file_name: "音トレ初段SCENE1_Q4.mp3"
        },
        {
          title: "Q5",
          file_name: "音トレ初段SCENE1_Q5.mp3"
        },
        {
          title: "Q6",
          file_name: "音トレ初段SCENE1_Q6.mp3"
        },
        {
          title: "Q7",
          file_name: "音トレ初段SCENE1_Q7.mp3"
        },
        {
          title: "Q8",
          file_name: "音トレ初段SCENE1_Q8.mp3"
        }
      ]
    }
  ]
  create_lessons_for("音トレ道場初段", lesson_data1)
end