import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "card", "card2" ]

  connect() {
    this.observer = new IntersectionObserver(entries => this.handleIntersect(entries), {})
    this.cardTargets.forEach(card => this.observer.observe(card))
    this.card2Targets.forEach(card2 => this.observer.observe(card2))
  }

  disconnect() {
    this.observer.disconnect()
  }

  handleIntersect(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate')
      } else {
        entry.target.classList.remove('animate')
      }
    })
  }
}
