class RatingSlider {
  constructor() {
    this.ratingSliderForm = document.querySelector(".js-rating-slider-form");
    this.ratingSliderInput = document.querySelector(".js-rating-slider-input");
    this.ratingSliderThumb = document.querySelector(".js-rating-slider-thumb");
    this.ratingSliderValue = document.querySelector(".js-rating-slider-value");
    this.ratingSliderIcon = document.querySelector(".js-rating-slider-icon");
    this.isClicked = false;
    this.bind();
  }

  updateRating(event) {
    if (!this.isClicked) {
      return;
    }
    if (
      event.offsetX > 0 &&
      event.offsetX < this.ratingSliderInput.offsetWidth
    ) {
      this.ratingSliderThumb.style.left = `${event.offsetX - 10}px`;
      this.ratingSliderIcon.style.transform = `scale(${1 +
        this.ratingSliderInput.value / 100})`;
      this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
    }
  }

  setRating() {
    this.ratingSliderThumb.style.left = `${(this.ratingSliderInput.offsetWidth /
      100) *
      this.ratingSliderInput.value -
      10}px`;
    this.ratingSliderIcon.style.transform = `scale(${1 +
      this.ratingSliderInput.value / 100})`;
    this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
    this.ratingSliderInput.addEventListener(
      "mousedown",
      () => (this.isClicked = true)
    );
    this.ratingSliderInput.addEventListener("mouseup", () => {
      this.isClicked = false;
      this.ratingSliderForm.submit();
    });
  }

  bind() {
    if (!this.ratingSliderThumb) {
      return;
    }
    this.setRating();
    this.ratingSliderInput.addEventListener("mousemove", event =>
      this.updateRating(event)
    );
  }
}

export default RatingSlider;
