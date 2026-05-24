document.addEventListener("turbo:load", () => {
  const likeBtn = document.querySelector(".my-list");
  const modalWindow = document.getElementById('modal-window');
  const modalContent = document.querySelector('.modal-content');
  const modalOkayBtn = document.getElementById('modal-okay-button');
  const modalMyList = document.querySelector('.modal-my-list h4');

  if (!likeBtn) return;

  likeBtn.addEventListener("click", () => {
    modalWindow.classList.add('active');
    likeBtn.classList.toggle("active");
    
    if (likeBtn.classList.contains("active")) {
      likeBtn.textContent = "マイリスト登録済";
      modalMyList.textContent = 'マイリストに登録しました。'
      likeBtn.innerHTML = `マイリストから削除する`
    } else {
      modalMyList.textContent = 'マイリストから削除しました。'
      likeBtn.innerHTML = `マイリストに登録する`
    }
  });

  modalOkayBtn.addEventListener("click", () => {
    modalWindow.classList.remove('active');
  })
});
