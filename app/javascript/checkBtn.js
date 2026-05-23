document.addEventListener("turbo:load", () => {
  const checkBtns = document.querySelectorAll(".check-btn");

  if (!checkBtns) return;

  checkBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      btn.classList.toggle("active");
  
      if (btn.classList.contains("active")) {
        btn.className = "fa-solid fa-circle-check check-btn active";
      } else {
        btn.className = "fa-regular fa-circle-check check-btn";
      }
    });
  }) 
});