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
end