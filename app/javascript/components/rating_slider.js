class RatingSlider {
  constructor() {
    this.ratingSliderForm = document.querySelector(".js-rating-slider-form");
    this.ratingSliderInput = document.querySelector(".js-rating-slider-input");
    this.ratingSliderThumb = document.querySelector(".js-rating-slider-thumb");
    this.ratingSliderValue = document.querySelector(".js-rating-slider-value");
    this.ratingSliderIcon = document.querySelector(".js-rating-slider-icon");
    this.isPressed = false;
    this.moveEvent;
    this.startEvent;
    this.endEvent;
    this.bind();
  }

  setEvents() {
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

  setCustomThumbStyle() {
    this.ratingSliderIcon.style.transform = `scale(${1 +
      this.ratingSliderInput.value / 150})`;
    this.ratingSliderValue.innerText = `${this.ratingSliderInput.value}°`;
  }

  setOffsetOnPageLoad() {
    this.ratingSliderThumb.style.left = `${(this.ratingSliderInput.offsetWidth /
      100) *
      this.ratingSliderInput.value -
      10}px`;
  }

  handleOffsetOnChange(event) {
    // ontouchstart -	Event occurs when screen is touched
    if ("ontouchstart" in document.documentElement) {
      // touches - Returns a list of all touch objects that are currently in contact with the surface
      // touches[0] - Looks only at the first touch
      // changedTouches - Returns a list of all touch objects whose state changed between the previous touch and this touch
      let touch = event.touches[0] || event.changedTouches[0];
      // touch.clientX - The horizontal coordinates of the touch
      // touch.clientY - The vertical coordinates of the touch
      // elementFromPoints - Returns the element that is located at the specified coordinates
      let target = document.elementFromPoint(touch.clientX, touch.clientY);
      // getBoundingClientRect - Returns the size of an element and its position relevant to the slider/target
      event.offsetX = touch.clientX - target.getBoundingClientRect().x;
    }
    if (
      // offsetX - Returns x-coordinate of mouse cursor, relative to target element
      // offsetWidth - Width of div including padding and border
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
    this.setEvents();
    this.setOffsetOnPageLoad();
    this.setCustomThumbStyle();

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
      this.setCustomThumbStyle();
    });
  }
}

export default RatingSlider;
