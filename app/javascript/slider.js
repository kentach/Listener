const sliderImages = [
  ...document.querySelectorAll('.slider-image')
];

let currentIndex = 0;

function changeSlide() {
  sliderImages[currentIndex]
    .classList.remove('active');
  currentIndex++;

  if (currentIndex >= sliderImages.length) {
    currentIndex = 0;
  }
  sliderImages[currentIndex]
    .classList.add('active');
}

// setInterval(changeSlide, 3000);