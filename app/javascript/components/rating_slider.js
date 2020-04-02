class RatingSlider {
  constructor() {
    this.ratingSliderForm = document.querySelector(".js-rating-slider-form");
    this.ratingSliderInput = document.querySelector(".js-rating-slider-input");
    this.ratingSliderThumb = document.querySelector(".js-rating-slider-thumb");
    this.ratingSliderValue = document.querySelector(".js-rating-slider-value");
    this.ratingSliderIcon = document.querySelector(".js-rating-slider-icon");
    this.isPressed = false;
    this.moveEvent;
    this.holdEvent;
    this.releaseEvent;
    this.bind();
  }

  handleSliding(event) {
    if (!this.isPressed) {
      return;
    }
    if (
      event.offsetX > 0 &&
      event.offsetX < this.ratingSliderInput.offsetWidth
    ) {
      this.ratingSliderThumb.style.left = `${event.offsetX - 10}px`;
      this.ratingSliderIcon.style.transform = `scale(${1 +
        this.ratingSliderInput.value / 150})`;
      this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
    }
  }

  setRating() {
    this.ratingSliderThumb.style.left = `${(this.ratingSliderInput.offsetWidth /
      100) *
      this.ratingSliderInput.value -
      10}px`;
    this.ratingSliderIcon.style.transform = `scale(${1 +
      this.ratingSliderInput.value / 150})`;
    this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
    this.ratingSliderInput.addEventListener(
      `${this.holdEvent}`,
      () => (this.isPressed = true)
    );
    this.ratingSliderInput.addEventListener(`${this.releaseEvent}`, () => {
      this.isPressed = false;
      this.ratingSliderForm.submit();
    });
  }

  setEvents() {
    if ("ontouchstart" in document.documentElement) {
      this.moveEvent = "touchmove";
      this.holdEvent = "touchstart";
      this.releaseEvent = "touchend";
    } else {
      this.moveEvent = "mousemove";
      this.holdEvent = "mousedown";
      this.releaseEvent = "mouseup";
    }
  }

  bind() {
    if (!this.ratingSliderForm) {
      return;
    }
    this.setEvents();
    this.setRating();
    this.ratingSliderInput.addEventListener(`${this.moveEvent}`, event =>
      this.handleSliding(event)
    );
  }
}

export default RatingSlider;
