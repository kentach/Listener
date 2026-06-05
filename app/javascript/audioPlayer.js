document.addEventListener('turbo:load', () => {

  const audio = document.getElementById("audio");
  const playBtn = document.querySelector('.play-btn');
  const stopBtn = document.querySelector('.stop-btn');
  const forwardBtn = document.getElementById('forward');
  const rewindBtn = document.getElementById('rewind');
  const loopBtn = document.getElementById('loopBtn');
  const speedCtrl = document.getElementById('speedControl');
  const toggleBtn = document.getElementById("playBtn");

  const duration = document.getElementById('duration');
  const currentTime = document.getElementById('currentTime');
  const progress = document.getElementById('progress');

  const threeSecondsForward = document.getElementById('threeSecondsForward');
  const threeSecondsBack = document.getElementById('threeSecondsBack');

  const englishBtn = document.querySelector('.english-btn');
  const japaneseBtn = document.querySelector('.japanese-btn');
  const container = document.querySelector('.ja-en-container');

  const enScript = document.getElementById("en-script");
  const jaScript = document.getElementById("ja-script");

  const sideBarItems = [...document.querySelectorAll(".side-bar-item")];
  const sideBar = document.querySelector('.side-bar')
  const sideBarCloseBtn = document.querySelector('.side-bar h1')
  const BackgroundContainer = document.querySelector('.ja-en-container');

  const openBtn = document.querySelector('.side-bar-toggle');
  const AudioBtn = document.querySelector('.side-bar-toggle h1');

  if (
    !audio ||
    !playBtn ||
    !englishBtn ||
    !japaneseBtn ||
    !container ||
    !openBtn ||
    !sideBar ||
    !sideBarCloseBtn
  ) return;

  let currentIndex = 0;
  const currentAudioId = audio.dataset.currentAudioId;

  currentIndex = sideBarItems.findIndex(item => {
    return item.dataset.audioId === currentAudioId;
  });

  if (currentIndex < 0) {
    currentIndex = 0;
  }

  function formatTime(time) {
    const min = Math.floor(time / 60);
    const sec = Math.floor(time % 60)
      .toString()
      .padStart(2, "0");
    return `${min}:${sec}`;
  }

  // ===== 音声セット =====
  function setAudio(item) {
    const currentAudioName = document.querySelector('.current-audio-name');
    if (currentAudioName) {
      currentAudioName.textContent = item.textContent;
    }
    audio.src = item.dataset.audio;
  }

  // ===== スクリプト表示 =====
  function showScript(i) {
    if (!audios[i]) return;
    enScript.innerText = audios[i].en_script;
    jaScript.innerText = audios[i].ja_script;
  }

  // ===== UI更新 =====
  function updateUI(index) {
    const currentItem = sideBarItems[index];
    // active削除
    sideBarItems.forEach(item => {
      item.classList.remove('active');
    });
    currentItem.classList.add('active');
  
    setAudio(currentItem);
    showScript(index);
  }

  // ===== 初期表示 =====
  updateUI(currentIndex);

  function playAudio() {
    audio.play().catch(() => {});
    playBtn.classList.add('hidden');
    stopBtn.classList.remove('hidden');
  }

  function pauseAudio() {
    audio.pause();
    playBtn.classList.remove('hidden');
    stopBtn.classList.add('hidden');
  }

  toggleBtn.addEventListener("click", () => {
    if (audio.paused) {
      playAudio();
    } else {
      pauseAudio();
    }
  });

  stopBtn.addEventListener('click', () => {
    pauseAudio();
  });

  function nextAudio() {
    if (currentIndex >= sideBarItems.length - 1) {
      currentIndex = 0;
    } else {
      currentIndex++;
    }

    updateUI(currentIndex);
    playAudio();
  }

  function prevAudio() {
    if (currentIndex <= 0) {
      currentIndex = sideBarItems.length - 1;
    } else {
      currentIndex--;
    }

    updateUI(currentIndex);
    playAudio();
  }

  audio.addEventListener("ended", () => {
    audio.currentTime = 0;
    nextAudio();
    progress.value = 0;
    progress.style.setProperty("--progress", "0%");
  });


  forwardBtn.addEventListener('click', () => {
    nextAudio();
    forwardBtn.classList.add('active');
    setTimeout(() => {
      forwardBtn.classList.remove('active');
    }, 300);
  });

  rewindBtn.addEventListener('click', () => {
    prevAudio();
    rewindBtn.classList.add('active');
    setTimeout(() => {
      rewindBtn.classList.remove('active');
    }, 300);
  });


  sideBarItems.forEach((item, index) => {
    item.addEventListener("click", () => {
      currentIndex = index;
      updateUI(currentIndex);
      playAudio();
    });
  });


  audio.ontimeupdate = () => {
    if (!audio.duration) return;
    const percent =
      (audio.currentTime / audio.duration) * 100;
    progress.value = percent;

    currentTime.textContent =
      formatTime(audio.currentTime);

    duration.textContent =
      formatTime(audio.duration);

    progress.style.setProperty(
      "--progress",
      `${percent}%`
    );
  };


  progress.oninput = () => {
    if (audio.duration) {
      audio.currentTime =
        (progress.value / 100) * audio.duration;
    }
  };


  speedCtrl.onchange = () => {
    audio.playbackRate =
      parseFloat(speedCtrl.value);
  };


  loopBtn.addEventListener('click', () => {
    audio.loop = !audio.loop;
    loopBtn.classList.toggle(
      'active',
      audio.loop
    );
  });

  
  threeSecondsForward.addEventListener('click', () => {
    threeSecondsForward.classList.add('active');

    audio.currentTime =
      Math.min(
        audio.duration || 0,
        audio.currentTime + 3
      );

    setTimeout(() => {
      threeSecondsForward.classList.remove('active');
    }, 300);
  });


  threeSecondsBack.addEventListener('click', () => {
    threeSecondsBack.classList.add('active');

    audio.currentTime =
      Math.max(
        0,
        audio.currentTime - 3
      );

    setTimeout(() => {
      threeSecondsBack.classList.remove('active');
    }, 300);
  });


  function displayEnglish() {
    container.classList.remove('show-japanese');

    japaneseBtn.classList.remove('btn-colored');
    englishBtn.classList.add('btn-colored');
  }


  function displayJapanese() {
    container.classList.add('show-japanese');

    englishBtn.classList.remove('btn-colored');
    japaneseBtn.classList.add('btn-colored');
  }

  englishBtn.addEventListener('click', () => {
    displayEnglish();
  });


  japaneseBtn.addEventListener('click', () => {
    displayJapanese();
  });


//サイドバー
  openBtn.addEventListener('click', () => {
    sideBar.classList.add('open');
    AudioBtn.classList.add('hide');
  })

  sideBarCloseBtn.addEventListener('click', () => {
    sideBar.classList.remove('open');
    AudioBtn.classList.remove('hide');
  })

  BackgroundContainer.addEventListener('click', () => {
    sideBar.classList.remove('open');
    AudioBtn.classList.remove('hide');
  })

});