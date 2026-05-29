document.addEventListener('turbo:load', () => {

  // ===== audio =====
  const audio = document.getElementById("audio");

  // ===== buttons =====
  const playBtn = document.querySelector('.play-btn');
  const stopBtn = document.querySelector('.stop-btn');
  const forwardBtn = document.getElementById('forward');
  const rewindBtn = document.getElementById('rewind');
  const loopBtn = document.getElementById('loopBtn');
  const speedCtrl = document.getElementById('speedControl');
  const toggleBtn = document.getElementById("playBtn");

  // ===== time =====
  const duration = document.getElementById('duration');
  const currentTime = document.getElementById('currentTime');
  const progress = document.getElementById('progress');

  // ===== 3 sec =====
  const threeSecondsForward = document.getElementById('threeSecondsForward');
  const threeSecondsBack = document.getElementById('threeSecondsBack');

  // ===== language buttons =====
  const englishBtn = document.querySelector('.english-btn');
  const japaneseBtn = document.querySelector('.japanese-btn');
  const container = document.querySelector('.ja-en-container');

  // ===== script =====
  const enScript = document.getElementById("en-script");
  const jaScript = document.getElementById("ja-script");

  // ===== sidebar =====
  const sideBarItems = [...document.querySelectorAll(".side-bar-item")];

  // ===== 必要なHTMLがなければ止める =====
  if (
    !audio ||
    !playBtn ||
    !englishBtn ||
    !japaneseBtn ||
    !container
  ) return;

  // ===== 現在のindex =====
  let currentIndex = 0;

  // ===== 現在再生中のaudio id =====
  const currentAudioId = audio.dataset.currentAudioId;

  // ===== 現在のaudioを探す =====
  currentIndex = sideBarItems.findIndex(item => {
    return item.dataset.audioId === currentAudioId;
  });

  // 見つからなければ0
  if (currentIndex < 0) {
    currentIndex = 0;
  }

  // ===== 時間表示 =====
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

    // active追加
    currentItem.classList.add('active');

    // 音声変更
    setAudio(currentItem);

    // script変更
    showScript(index);
  }

  // ===== 初期表示 =====
  updateUI(currentIndex);

  // ===== 再生 =====
  function playAudio() {

    audio.play().catch(() => {});

    playBtn.classList.add('hidden');
    stopBtn.classList.remove('hidden');
  }

  // ===== 一時停止 =====
  function pauseAudio() {

    audio.pause();

    playBtn.classList.remove('hidden');
    stopBtn.classList.add('hidden');
  }

  // ===== 再生ボタン =====
  toggleBtn.addEventListener("click", () => {

    if (audio.paused) {
      playAudio();
    } else {
      pauseAudio();
    }
  });

  // ===== 停止ボタン =====
  stopBtn.addEventListener('click', () => {
    pauseAudio();
  });

  // ===== 次へ =====
  function nextAudio() {

    if (currentIndex >= sideBarItems.length - 1) {
      currentIndex = 0;
    } else {
      currentIndex++;
    }

    updateUI(currentIndex);
    playAudio();
  }

  // ===== 前へ =====
  function prevAudio() {

    if (currentIndex <= 0) {
      currentIndex = sideBarItems.length - 1;
    } else {
      currentIndex--;
    }

    updateUI(currentIndex);
    playAudio();
  }

  // ===== 音声終了 =====
  audio.addEventListener("ended", () => {

    audio.currentTime = 0;

    nextAudio();

    progress.value = 0;
    progress.style.setProperty("--progress", "0%");
  });

  // ===== 次へボタン =====
  forwardBtn.addEventListener('click', () => {

    nextAudio();

    forwardBtn.classList.add('active');

    setTimeout(() => {
      forwardBtn.classList.remove('active');
    }, 300);
  });

  // ===== 前へボタン =====
  rewindBtn.addEventListener('click', () => {

    prevAudio();

    rewindBtn.classList.add('active');

    setTimeout(() => {
      rewindBtn.classList.remove('active');
    }, 300);
  });

  // ===== サイドバークリック =====
  sideBarItems.forEach((item, index) => {

    item.addEventListener("click", () => {

      currentIndex = index;

      updateUI(currentIndex);

      playAudio();
    });
  });

  // ===== progress =====
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

  // ===== progress操作 =====
  progress.oninput = () => {

    if (audio.duration) {

      audio.currentTime =
        (progress.value / 100) * audio.duration;
    }
  };

  // ===== 再生速度 =====
  speedCtrl.onchange = () => {

    audio.playbackRate =
      parseFloat(speedCtrl.value);
  };

  // ===== loop =====
  loopBtn.addEventListener('click', () => {

    audio.loop = !audio.loop;

    loopBtn.classList.toggle(
      'active',
      audio.loop
    );
  });

  // ===== +3秒 =====
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

  // ===== -3秒 =====
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

  // ===== 英語表示 =====
  function displayEnglish() {

    container.classList.remove('show-japanese');

    japaneseBtn.classList.remove('btn-colored');
    englishBtn.classList.add('btn-colored');
  }

  // ===== 日本語表示 =====
  function displayJapanese() {

    container.classList.add('show-japanese');

    englishBtn.classList.remove('btn-colored');
    japaneseBtn.classList.add('btn-colored');
  }

  // ===== 英語ボタン =====
  englishBtn.addEventListener('click', () => {
    displayEnglish();
  });

  // ===== 日本語ボタン =====
  japaneseBtn.addEventListener('click', () => {
    displayJapanese();
  });

});