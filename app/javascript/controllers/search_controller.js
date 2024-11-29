import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  submit(e) {
    e.target.closest("form").submit();
  }
}
