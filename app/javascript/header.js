
const hamburgerMenu = document.getElementById('hamburger-menu');
const hamburgerButton = document.getElementById("hamburger-btn");
const overlay = document.getElementById("menu-overlay");

hamburgerButton.addEventListener('click', () => {
    hamburgerMenu.classList.toggle('open');
    overlay.classList.toggle('active');
  })

  overlay.addEventListener('click', () => {
    hamburgerButton.classList.remove('active');
    hamburgerMenu.classList.remove('open');
    overlay.classList.remove('active');
  })

