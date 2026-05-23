
document.addEventListener('turbo:load', () => {
  const sideBar = document.querySelector('.side-bar')
  const closeBtn = document.querySelector('.fa-angle-up');
  const openBtn = document.querySelector('.side-bar-toggle');

  if (!openBtn || !sideBar) return;

  openBtn.addEventListener('click', () => {
    sideBar.classList.add('open');
  })

  closeBtn.addEventListener('click', () => {
    sideBar.classList.remove('open');
  })
})