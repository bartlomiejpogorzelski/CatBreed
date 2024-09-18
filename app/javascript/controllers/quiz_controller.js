// app/javascript/controllers/quiz_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio"]

  // submitAnswer(event) {

  //   event.preventDefault();
  //   this.radioTargets.find(radio => radio.checked);  
  //   console.log(selectedRadio.value);
  // } 

  selectOption(event) {

    event.preventDefault();

    const correctAnswer = event.target.dataset.correctAnswer;
    // const userAnswer = event.target.value;  // User answer like A, B, C, D
    const form = event.target.closest("form");
  
    // Remove previous styles classes
    form.querySelectorAll("input").forEach(input => {
      input.classList.remove("bg-green-500", "bg-red-500", "text-white");
    });
  
    // Text from answer, not A, B, C, D. 
    const selectedAnswerText = event.target.nextSibling.textContent.trim();
  
    if (selectedAnswerText === correctAnswer) {
      console.log("Correct answer");
      this.showCorrect(event.target);
    } else {
      console.log("Failure answer");
      this.showIncorrect(event.target);
    }
  }

  showCorrect(target) {
    target.closest("label").classList.add("bg-green-500", "text-white");
  }

  showIncorrect(target) {
    target.closest("label").classList.add("bg-red-500", "text-white");
  }
}