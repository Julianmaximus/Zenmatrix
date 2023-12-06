import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "card", "card2" ]
  lastScrollTop = 0;

  connect() {
    this.observer = new IntersectionObserver(entries => this.handleIntersect(entries), {
      rootMargin: '0px',
      threshold: 0.1
    });
    this.cardTargets.forEach(card => this.observer.observe(card));
    this.card2Targets.forEach(card2 => this.observer.observe(card2));
  }

  disconnect() {
    this.observer.disconnect();
  }

  handleIntersect(entries) {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    entries.forEach(entry => {
      if (entry.isIntersecting && scrollTop > this.lastScrollTop) {
        entry.target.classList.add('animate');
      } else {
        entry.target.classList.remove('animate');
      }
    });
    this.lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
  }
}
