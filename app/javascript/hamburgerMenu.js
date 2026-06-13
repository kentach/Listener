document.addEventListener('turbo:load', () => {
  const hamburgerMenu = document.getElementById('hamburger-menu');
  const hamburgerButton = document.getElementById("hamburger-btn");
  const overlay = document.getElementById("menu-overlay");

  if (!hamburgerButton || !overlay) return

  hamburgerButton.addEventListener('click', () => {
      hamburgerMenu.classList.toggle('open');
      hamburgerButton.classList.toggle('active');
      overlay.classList.toggle('active');
    })
  
    overlay.addEventListener('click', () => {
      hamburgerButton.classList.remove('active');
      hamburgerMenu.classList.remove('open');
      overlay.classList.remove('active');
    })
})

