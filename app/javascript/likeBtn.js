document.addEventListener("turbo:load", () => {
  const likeBtn = document.querySelector(".my-list");
  if (!likeBtn) return;

  likeBtn.addEventListener("click", () => {
    likeBtn.classList.toggle("active");
    if (likeBtn.classList.contains("active")) {
      likeBtn.textContent = "マイリスト登録済";
    } else {
      likeBtn.innerHTML = `マイリストに追加 <i class="bi bi-heart"></i>`;
    }
  });
});
