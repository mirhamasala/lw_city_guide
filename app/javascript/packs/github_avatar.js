const userAvatar = document.querySelector(".avatar");
const userHandle = document.querySelector("[data-handle]").dataset.handle;

const checkIfAvatar = () => {
  if (!userHandle) {
    return;
  }
  getAvatar();
}

const getAvatar = () => {
  const url = `https://api.github.com/users/${userHandle}`;
  fetch(url).then(response => response.json())
  .then((data) => {
    userAvatar.src = data.avatar_url;
  });
}

export { checkIfAvatar };
