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

  setCustomThumbStyleOnLoad() {
    this.ratingSliderThumb.style.left = `${(this.ratingSliderInput.offsetWidth /
      100) *
      this.ratingSliderInput.value -
      10}px`;
    this.ratingSliderIcon.style.transform = `scale(${1 +
      this.ratingSliderInput.value / 150})`;
    this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
  }

  setOffsets(e) {
    if ("ontouchstart" in document.documentElement) {
      debugger;
      let touch = e.touches[0] || event.changedTouches[0];
      let target = document.elementFromPoint(touch.clientX, touch.clientY);
      event.offsetX = touch.clientX - target.getBoundingClientRect().x;
      event.offsetY = touch.clientY - target.getBoundingClientRect().y;
      return e;
    }
    return event;
  }

  handleCustomThumbStyleOnChange(event) {
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

  bind() {
    if (!this.ratingSliderForm) {
      return;
    }
    this.setCustomThumbStyleOnLoad();
    this.setEvents();
    this.ratingSliderInput.addEventListener(
      this.holdEvent,
      () => (this.isPressed = true)
    );
    this.ratingSliderInput.addEventListener(this.releaseEvent, () => {
      this.isPressed = false;
      this.ratingSliderForm.submit();
    });
    this.ratingSliderInput.addEventListener(this.moveEvent, event => {
      if (!this.isPressed) {
        return;
      }
      event = this.setOffsets(event);
      this.handleCustomThumbStyleOnChange(event);
    });
  }
}

export default RatingSlider;
