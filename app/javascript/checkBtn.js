document.addEventListener("turbo:load", () => {
  const checkBtn = document.querySelector(".check-btn");

  if (!checkBtn) return;

  checkBtn.addEventListener("click", () => {
    checkBtn.classList.toggle("active");

    if (checkBtn.classList.contains("active")) {
      checkBtn.className = "fa-solid fa-circle-check check-btn active";
    } else {
      checkBtn.className = "fa-regular fa-circle-check check-btn";
    }
  });

});