document.addEventListener("turbo:load", () => {

  const textbookCards = document.querySelectorAll(".textbook-card");
  const modal = document.getElementById("modal");
  const modalImage = document.getElementById("modal-image");
  const modalTitle = document.getElementById("modal-title");
  const modalLevel = document.getElementById("modal-level");
  const modalLink = document.getElementById("modal-link");
  const closeBtn = document.getElementById("close-modal");

  if (!modal) return;

  textbookCards.forEach(card => {
    
    card.addEventListener("click", () => {
      modalImage.src = card.dataset.image;
      modalTitle.textContent = card.dataset.name;
      modalLevel.textContent =
        `レベル：${card.dataset.level}`;
      modalLink.href = card.dataset.link;
      modal.classList.add("active");
    });
  });

  closeBtn.addEventListener("click", () => {
    modal.classList.remove("active");
  });

  modal.addEventListener("click", () => {
    modal.classList.remove("active");
  });

});