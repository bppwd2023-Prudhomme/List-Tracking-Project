import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["users","groups"];

  greet() {
    var changeVal = this.querySelector("div").children[1].value;
    const users = this.usersTarget;
    const groups = this.groupsTarget;
    console.log(changeVal, users, groups);
  }
}