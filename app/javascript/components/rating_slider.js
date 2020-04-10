class RatingSlider {
  constructor() {
    this.ratingSliderForm = document.querySelector(".js-rating-slider-form");
    this.ratingSliderInput = document.querySelector(".js-rating-slider-input");
    this.ratingSliderThumb = document.querySelector(".js-rating-slider-thumb");
    this.ratingSliderValue = document.querySelector(".js-rating-slider-value");
    this.ratingSliderIcon = document.querySelector(".js-rating-slider-icon");
    this.isPressed = false;
    this.setEvents();
    this.bind();
  }
  setEvents() {
    this.moveEvent;
    this.startEvent;
    this.endEvent;
    if ("ontouchstart" in document.documentElement) {
      this.moveEvent = "touchmove";
      this.startEvent = "touchstart";
      this.endEvent = "touchend";
    } else {
      this.moveEvent = "mousemove";
      this.startEvent = "mousedown";
      this.endEvent = "mouseup";
    }
  }

  setThumbStyle() {
    this.ratingSliderIcon.style.transform = `scale(${1 +
      this.ratingSliderInput.value / 150})`;
    this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
  }

  setPositionThumb() {
    this.ratingSliderThumb.style.left = `${(this.ratingSliderInput.offsetWidth /
      100) *
      this.ratingSliderInput.value -
      10}px`;
  }

  handleOffsetOnChange(event) {
    if ("ontouchstart" in document.documentElement) {
      let touch = event.touches[0];
      let target = this.ratingSliderInput;
      event.offsetX = touch.clientX - target.getBoundingClientRect().x;
    }
    if (
      event.offsetX > 0 &&
      event.offsetX < this.ratingSliderInput.offsetWidth
    ) {
      this.ratingSliderThumb.style.left = `${event.offsetX - 10}px`;
    }
  }

  bind() {
    if (!this.ratingSliderForm) {
      return;
    }
    window.addEventListener("load", () => {
      this.setThumbStyle();
      this.setPositionThumb();
    });

    window.addEventListener("resize", () => this.setPositionThumb());

    this.ratingSliderInput.addEventListener(
      this.startEvent,
      () => (this.isPressed = true)
    );

    this.ratingSliderInput.addEventListener(this.endEvent, () => {
      this.isPressed = false;
      this.ratingSliderForm.submit();
    });

    this.ratingSliderInput.addEventListener(this.moveEvent, event => {
      if (!this.isPressed) {
        return;
      }
      this.handleOffsetOnChange(event);
      this.setThumbStyle();
    });
  }
}

export default RatingSlider;
