class RatingSlider {
  constructor() {
    this.ratingInput = document.querySelector("#rating_score");
    this.thumb = document.querySelector("#thumb");
    this.ratingForm = document.querySelector("#rating-form");
    this.isClicked = false;
    this.bind();
  }

  updateSlider(event) {
    if (!this.isClicked) {
      return;
    }
    if (event.offsetX > 0 && event.offsetX < this.ratingInput.offsetWidth) {
      this.thumb.style.left = `${event.offsetX - 10}px`;
      this.thumb.querySelector(".fire").style.transform = `scale(${1 +
        this.ratingInput.value / 100})`;
      this.thumb.querySelector(
        ".value"
      ).innerText = `${this.ratingInput.value}°`;
    }
  }

  ratingSlider() {
    this.thumb.style.left = `${(this.ratingInput.offsetWidth / 100) *
      this.ratingInput.value -
      10}px`;
    this.thumb.querySelector(".fire").style.transform = `scale(${1 +
      this.ratingInput.value / 100})`;
    this.thumb.querySelector(".value").innerText = `${this.ratingInput.value}°`;
    this.ratingInput.addEventListener(
      "mousedown",
      () => (this.isClicked = true)
    );
    this.ratingInput.addEventListener("mouseup", () => {
      this.isClicked = false;
      this.ratingForm.submit();
    });
  }

  bind() {
    if (!this.thumb) {
      return;
    }
    this.ratingSlider();
    this.ratingInput.addEventListener("mousemove", event =>
      this.updateSlider(event)
    );
  }
}

export default RatingSlider;
