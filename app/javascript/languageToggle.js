  document.addEventListener("turbo:load", () => {
    const englishBtn = document.querySelector('.english-btn');
    const japaneseBtn = document.querySelector('.japanese-btn');
    const container = document.querySelector('.ja-en-container');
    const englishContainer = document.querySelector(".english-container");
    const japaneseContainer = document.querySelector(".japanese-container");

  if (!englishBtn || !japaneseBtn || !englishContainer || !japaneseContainer || !container)
    return;

  displayEnglish();
  displayJapanese();

  function displayEnglish() {
    englishBtn.addEventListener('click', () => {
      container.classList.remove('show-japanese');
      japaneseBtn.classList.remove('btn-colored');
      englishBtn.classList.add('btn-colored');
    });
  }

  function displayJapanese() {
    japaneseBtn.addEventListener('click', () => {
      container.classList.add('show-japanese');
      englishBtn.classList.remove('btn-colored');
      japaneseBtn.classList.add('btn-colored');
    });    
  }
});
