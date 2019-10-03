const userHandle = document.querySelector("[data-handle]");

const getAvatar = () => {
  const avatar = document.querySelector(".avatar");
  const url = `https://api.github.com/users/${userHandle.dataset.handle}`;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      avatar.src = data.avatar_url;
    });
};

const initGetAvatar = () => {
  if (!userHandle) {
    return;
  }
  getAvatar();
};

export { initGetAvatar };
