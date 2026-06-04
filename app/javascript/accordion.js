document.addEventListener('turbo:load', () => {
  const accordionBtn = document.querySelector('.accordion-button');
  const accordion = document.querySelector('.accordion');
    if (!accordionBtn) return;

  accordionBtn.addEventListener('click', () => {
    accordionBtn.classList.toggle('fa-circle-chevron-down');
    accordionBtn.classList.toggle('fa-circle-chevron-up');
    accordion.classList.toggle('open');
  })

})