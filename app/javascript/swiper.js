document.addEventListener("turbo:load", () => {
  new Swiper(".swiper", {
    loop: true,
    slidesPerView: 2,
    spaceBetween: 100,
    allowTouchMove: false,
    speed: 3000,
    autoplay: {
      delay: 0,
      disableOnInteraction: false,
    },
  });
});