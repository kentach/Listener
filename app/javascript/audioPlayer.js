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

  const currentAudioId = audio.dataset.currentAudioId;
  const sideBarItems = [...document.querySelectorAll(".side-bar-item")];
  let currentIndex = 0;

  currentIndex = sideBarItems.findIndex(item => {
    return item.dataset.audioId === currentAudioId;
  });
  
  const formatTime = (time) => {
    const min = Math.floor(time / 60);
    const sec = Math.floor(time % 60).toString().padStart(2, "0");
    return `${min}:${sec}`;
  };

  if (currentIndex >= 0) {
    sideBarItems[currentIndex].classList.add('active');
    setAudio(sideBarItems[currentIndex]);
  }

  function setAudio (item) {
    const audioPath = item.dataset.audio;
      audio.src = audioPath;
  };

  function playAudio () {
    audio.play().catch(() => {});
    playBtn.classList.add('hidden');
    stopBtn.classList.remove('hidden');
  }

  function pauseAudio () {
    audio.pause();
    playBtn.classList.remove('hidden');
    stopBtn.classList.add('hidden');
  }

  //再生ボタンと停止ボタンの切り替え
  toggleBtn.addEventListener("click", () => {
    const activeItem = document.querySelector(".side-bar-item.active");
  
    if (activeItem) {
      currentIndex = sideBarItems.indexOf(activeItem);
    }
  
    if (audio.paused) {
      playAudio ()
  
      sideBarItems.forEach(item => {
        item.classList.remove('active');
      });
  
      sideBarItems[currentIndex].classList.add('active');
    } else {
      pauseAudio();
    }
  });

    //一時停止ボタン
    stopBtn.addEventListener('click', () => {
      pauseAudio () 
    });

    //終わったら最初に戻る
    audio.addEventListener("ended", () => {
      audio.currentTime = 0;
    
      playBtn.classList.remove("hidden");
      stopBtn.classList.add("hidden");
    
      progress.value = 0;
      progress.style.setProperty("--progress", "0%");
    });


    //進捗バー
    audio.ontimeupdate = () => {
      if (!audio.duration) return;
    
      const percent = (audio.currentTime / audio.duration) * 100;
      progress.value = percent;
      currentTime.textContent = formatTime(audio.currentTime);
      duration.textContent = formatTime(audio.duration);
      progress.style.setProperty("--progress", `${percent}%`);
    };

    //進捗バーをユーザーが操作したとき
    progress.oninput = () => {
      if (audio.duration) {
        audio.currentTime = (progress.value / 100) * audio.duration;
      }
    };

  // 速度調整
  speedCtrl.onchange = () => {
    audio.playbackRate = parseFloat(speedCtrl.value);
  };

  // ループ
  loopBtn.addEventListener('click', () => {
    audio.loop = !audio.loop;
    loopBtn.classList.toggle('active', audio.loop);
  })

  // +3秒
  threeSecondsForward.addEventListener('click', () => {
    threeSecondsForward.classList.add('active');
    audio.currentTime = Math.min(audio.duration || 0, audio.currentTime + 3);
    setTimeout(() => {
      threeSecondsForward.classList.remove('active');
    }, 300)
  })

  // -3秒
  threeSecondsBack.addEventListener('click', () => {
    threeSecondsBack.classList.add('active');
    audio.currentTime = Math.max(0, audio.currentTime - 3);
    setTimeout(() => {
      threeSecondsBack.classList.remove('active');
    }, 300)
  })

  // 次の音源にスキップボタン
    forwardBtn.addEventListener('click', () => {
      sideBarItems.forEach(item => {
        item.classList.remove('active')
      })

      if (currentIndex >= sideBarItems.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }

      const currentItem = sideBarItems[currentIndex];
      currentItem.classList.add('active');
      setAudio(currentItem)
      playAudio();

      forwardBtn.classList.add('active');
      setTimeout(() => {
        forwardBtn.classList.remove('active');
      }, 300)
    })

  // 前の音源にスキップボタン
  rewindBtn.addEventListener('click', () => {
    sideBarItems.forEach(item => {
      item.classList.remove('active')
    })
    if (currentIndex <= 0) {
      currentIndex = sideBarItems.length - 1
    } else {
      currentIndex--;
    }

    const currentItem = sideBarItems[currentIndex];
    currentItem.classList.add('active');
    setAudio(currentItem);
    playAudio();

    rewindBtn.classList.add('active');
    setTimeout(() => {
      rewindBtn.classList.remove('active');
    }, 300)
  })

  //サイドバー
  sideBarItems.forEach((item, index) => {
    item.addEventListener("click", () => {
      sideBarItems.forEach(item => {
        item.classList.remove('active')
      })

      currentIndex = index;
      item.classList.add('active')

      setAudio(item)
      playAudio();
    });
  });
})