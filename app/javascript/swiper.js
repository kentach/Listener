document.addEventListener("turbo:load", () => {
  new Swiper(".swiper", {
    loop: true,
    slidesPerView: 2,
    spaceBetween: 40,
    allowTouchMove: false,
    speed: 2000,
    autoplay: {
      delay: 1,
      disableOnInteraction: false,
    },
  });
});