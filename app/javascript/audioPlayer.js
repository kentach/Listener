document.addEventListener('turbo:load', () => {
  const audio = document.getElementById("audio");

  const playBtn = document.querySelector('.play-btn');
  const stopBtn = document.querySelector('.stop-btn');
  const forwardBtn = document.getElementById('forward');
  const rewindBtn = document.getElementById('rewind');
  const loopBtn = document.getElementById('loopBtn');
  const speedCtrl = document.getElementById('speedControl');
  const duration = document.getElementById('duration');
  const currentTime = document.getElementById('currentTime');
  const threeSecondsForward = document.getElementById('threeSecondsForward');
  const threeSecondsBack = document.getElementById('threeSecondsBack');
  const progress = document.getElementById('progress');
  const toggleBtn = document.getElementById("playBtn");

  if(!playBtn || !audio) return

  const formatTime = (time) => {
    const min = Math.floor(time / 60);
    const sec = Math.floor(time % 60).toString().padStart(2, "0");
    return `${min}:${sec}`;
  };

  //終わったら最初に戻る
  audio.addEventListener("ended", () => {
    audio.currentTime = 0;
  
    playBtn.classList.remove("hidden");
    stopBtn.classList.add("hidden");
  
    progress.value = 0;
    progress.style.setProperty("--progress", "0%");
  });

  //再生ボタンと停止ボタンの切り替え
  toggleBtn.addEventListener("click", () => {
    if (audio.paused) {
      audio.play().catch(() => {});
      playBtn.classList.add('hidden');
      stopBtn.classList.remove('hidden')
    } else {
      audio.pause();
    }
  });

  //一時停止ボタン
  stopBtn.addEventListener('click', () => {
    playBtn.classList.remove('hidden');
    stopBtn.classList.add('hidden')
    audio.pause();
  });

  audio.ontimeupdate = () => {
    if (!audio.duration) return;
  
    const percent = (audio.currentTime / audio.duration) * 100;
  
    progress.value = percent;
    currentTime.textContent = formatTime(audio.currentTime);
    duration.textContent = formatTime(audio.duration);
    progress.style.setProperty("--progress", `${percent}%`);
  };


  progress.oninput = () => {
    if (audio.duration) {
      audio.currentTime = (progress.value / 100) * audio.duration;
    }
  };

  // 速度調整
  speedCtrl.onchange = () => {
    audio.playbackRate = parseFloat(speedControl.value);
  };

  // ループ
  loopBtn.addEventListener('click', () => {
    audio.loop = !audio.loop;
    loopBtn.classList.toggle('active', audio.loop);
  })


  // 3秒ボタン
  threeSecondsForward.addEventListener('click', () => {
    threeSecondsForward.classList.add('active');
    audio.currentTime = Math.min(audio.duration || 0, audio.currentTime + 3);
    setTimeout(() => {
      threeSecondsForward.classList.remove('active');
    }, 300)
  })

  threeSecondsBack.addEventListener('click', () => {
    threeSecondsBack.classList.add('active');
    audio.currentTime = Math.max(0, audio.currentTime - 3);
    setTimeout(() => {
      threeSecondsBack.classList.remove('active');
    }, 300)
  })


  // 先スキップボタン
  forwardBtn.addEventListener('click', () => {
    forwardBtn.classList.add('active');
    setTimeout(() => {
      forwardBtn.classList.remove('active');
    }, 300)
  })

  // 戻りスキップボタン
  rewindBtn.addEventListener('click', () => {
    rewindBtn.classList.add('active');
    
    setTimeout(() => {
      rewindBtn.classList.remove('active');
    }, 300)
  })

})