import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('slid.bs.carousel', this.updateNavigationBar.bind(this));
  }

  disconnect() {
    this.element.removeEventListener('slid.bs.carousel', this.updateNavigationBar.bind(this));
  }

  goToSlide(event) {
    const slideIndex = event.currentTarget.id.split('--')[1];
    this.element.carousel(parseInt(slideIndex));
    this.updateNavigationBar();
  }

  updateNavigationBar() {
    const activeSlideIndex = this.element.querySelector('.carousel-item.active').dataset.slideIndex;
    document.querySelectorAll('.navigation-bar__slide .navigation-bar__fills').forEach(el => el.classList.remove('navigation-bar--active'));
    document.querySelector('#slide--' + activeSlideIndex + ' .navigation-bar__fills').classList.add('navigation-bar--active');
  }
}
