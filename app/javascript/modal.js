document.addEventListener('turbo:load', () => {
  const textbookImages = document.querySelectorAll('.textbook-img');
  const closeBtn = document.querySelector('.fa-x');
  const modalBackground = document.getElementById('modal');
  const modalInner = document.querySelector('.modal-inner');

  if (!textbookImages || !closeBtn || !modalBackground || !modalInner) return;

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
});