document.addEventListener('turbo:load', () => {
  const englishBtn = document.querySelector('.en');
  const japaneseBtn = document.querySelector('.ja');
  const englishContainer = document.querySelector('.english-container');
  const japaneseContainer = document.querySelector('.japanese-container');

  if (!englishBtn || !japaneseBtn || !englishContainer || !japaneseContainer) return;

  japaneseContainer.classList.add('hidden');
  englishBtn.classList.add('active');

  displayEnglish();
  displayJapanese();

  function displayEnglish() {
    englishBtn.addEventListener('click', () => {
      englishBtn.classList.add('active');
      japaneseBtn.classList.remove('active');

      englishContainer.classList.remove('hidden');
      japaneseContainer.classList.add('hidden');
    });
  }
  
  function displayJapanese() {
    japaneseBtn.addEventListener('click', () => {
      japaneseBtn.classList.add('active');
      
      
      englishBtn.classList.remove('active');

      japaneseContainer.classList.remove('hidden');
    });
  }
});

