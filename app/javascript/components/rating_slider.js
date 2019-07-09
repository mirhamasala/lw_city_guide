const ratingInput = document.querySelector('#rating_score');
const thumb = document.querySelector('#thumb');
const ratingForm = document.querySelector('#rating-form');
let isClicked = false;

function updateSlider(event) {
  if (!isClicked) {
    return;
  }
  if (event.offsetX > 0 && event.offsetX < ratingInput.offsetWidth) {
    thumb.style.left = `${event.offsetX - 10}px`;
    thumb.querySelector('.fire').style.transform = `scale(${1 + (ratingInput.value / 100)})`;
    thumb.querySelector('.value').innerText = `${ratingInput.value}°`;
  }
}

function ratingSlider() {
  thumb.style.left = `${((ratingInput.offsetWidth / 100) * ratingInput.value) - 10}px`;
  thumb.querySelector('.fire').style.transform = `scale(${1 + (ratingInput.value / 100)})`;
  thumb.querySelector('.value').innerText = `${ratingInput.value}°`;

  ratingInput.addEventListener('mousedown', (event) => isClicked = true)
  ratingInput.addEventListener('mouseup', (event) => { 
    isClicked = false;
    ratingForm.submit();
  })
  ratingInput.addEventListener('mousemove', updateSlider);
}

window.ratingSlider = ratingSlider;


export default { ratingSlider };