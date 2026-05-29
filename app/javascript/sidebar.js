
document.addEventListener('turbo:load', () => {
  const sideBar = document.querySelector('.side-bar')
  const sideBarCloseBtn = document.querySelector('.side-bar h1')
  const BackgroundContainer = document.querySelector('.ja-en-container');
  const closeBtn = document.querySelector('.fa-angle-up');
  const openBtn = document.querySelector('.side-bar-toggle');
  const AudioBtn = document.querySelector('.side-bar-toggle h1');

  if (!openBtn || !sideBar || !sideBarCloseBtn) return;

  openBtn.addEventListener('click', () => {
    sideBar.classList.add('open');
    AudioBtn.classList.add('hide');
  })

  sideBarCloseBtn.addEventListener('click', () => {
    sideBar.classList.remove('open');
    AudioBtn.classList.remove('hide');
  })

  BackgroundContainer.addEventListener('click', () => {
    sideBar.classList.remove('open');
    AudioBtn.classList.remove('hide');
  })
})