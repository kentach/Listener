const ontreTextbooks = [
  {name: '音トレ道場初段', image: 'ontra_beginner.png'},
  {name: '音トレ道場2段', image: 'ontra_step2.png'},
  {name: '音トレ道場3段', image: 'ontra_step3.png'},
  {name: '音トレ道場4段', image: 'ontra_step4.png'},
  {name: '音トレ道場5段', image: 'ontra_step5.png'},
  {name: '音トレ道場6段', image: 'ontra_step6.png'},
];

const rhythmasTextbooks = [
  {name: 'リズムでマスター準１級', image: 'rhythmas_pre1.png'},
  {name: 'リズムでマスター準２級', image: 'rhythmas_pre2.png'},
  {name: 'リズムでマスター２級', image: 'rhythmas_step2.png'},
  {name: 'リズムでマスター３級', image: 'rhythmas_step3.png'},
  {name: 'リズムでマスター４級', image: 'rhythmas_step4.png'},
  {name: 'リズムでマスター５級', image: 'rhythmas_step5.png'},
];

const textbookImages = document.querySelectorAll('.textbook-img');
const closeBtn = document.querySelector('.fa-solid');
const modalBackground = document.getElementById('modal');
const modalInner = document.querySelector('.modal-inner');

textbookImages.forEach((textbook) => {
  textbook.addEventListener('click', () => {
    modalBackground.classList.add('active');
  });
});

closeBtn.addEventListener('click', () => {
  modalBackground.classList.remove('active');
});

modalBackground.addEventListener('click', () => {
  modalBackground.classList.remove('active');
});

modalInner.addEventListener('click', (e) => {
  e.stopPropagation();
});
