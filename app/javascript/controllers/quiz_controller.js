// app/javascript/controllers/quiz_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "element", "nextButton", "previousButton"]

  connect() {
    // console.log("Next button:", this.nextButtonTarget); // Check: nextButtonTarget is accessible
    this.currentQuizIndex = 0;
    this.showQuiz(this.currentQuizIndex);
  }

  showQuiz(index) {
    console.log("Displaying quiz with index:", index);
    console.log("Number of quiz elements:", this.elementTargets.length);

    this.elementTargets.forEach((element, i) => {
      if (i === index) {
        element.classList.remove("hidden");
      } else {
        element.classList.add("hidden");
      }
    });

    this.updateNavigationButtons();
  }

  nextQuiz() {
    this.currentQuizIndex++;
    this.showQuiz(this.currentQuizIndex);
  }

  previousQuiz() {
    this.currentQuizIndex--;
    this.showQuiz(this.currentQuizIndex);
  }

  updateNavigationButtons() {
    if (this.currentQuizIndex === 0) {
      this.hidePreviousButton();
    } else {
      this.showPreviousButton();
    }

    if (this.currentQuizIndex === this.elementTargets.length - 1) {
      this.hideNextButton();
    } else {
      this.showNextButton();
    }
  }

  hideNextButton() {
    this.nextButtonTarget.classList.add("hidden"); 
  }

  hidePreviousButton() {
    this.previousButtonTarget.classList.add("hidden"); 
  }

  showNextButton() {
    this.nextButtonTarget.classList.remove("hidden"); 
  }

  showPreviousButton() {
    this.previousButtonTarget.classList.remove("hidden"); 
  }
  
  selectOption(event) {

    event.preventDefault();

    const correctAnswer = event.target.dataset.correctAnswer;
    // const userAnswer = event.target.value;  // User answer like A, B, C, D
    const form = event.target.closest("form");

    //block choices after click
    form.querySelectorAll("input[type='radio']").forEach(input => {
      input.disabled = true;
    });

    // Remove previous styles classes
    form.querySelectorAll("input").forEach(input => {
      input.classList.remove("bg-green-500", "bg-red-500", "text-white");
    });
  
    // Text from answer, not A, B, C, D. 
    const selectedAnswerText = event.target.nextElementSibling.textContent.trim();
    console.log("Correct " +correctAnswer );
    console.log("Choice " +selectedAnswerText );

    if (selectedAnswerText === correctAnswer) {
      console.log("Correct answer");
      this.showCorrect(event.target);
    } else {
      console.log("Failure answer");
      this.showIncorrect(event.target);
    }
  }

  showCorrect(target) {
    console.log("form "+target);
    target.nextElementSibling.classList.add("bg-green-500", "text-white");
    this.showNotification("Poprawna odpowiedź!", "green");
  }

  showIncorrect(target) {
    console.log("form "+target);

    target.nextElementSibling.classList.add("bg-red-500", "text-white");
    this.showNotification("Błędna odpowiedź!", "red");
  }

  showNotification(message, color) {
    const notification = document.createElement('div');
    notification.innerText = message;
    notification.style.backgroundColor = color === "green" ? "#4CAF50" : "#F44336";
    notification.style.color = "white";
    notification.style.padding = "15px";
    notification.style.position = "fixed";
    notification.style.top = "50%"; // Ustawia powiadomienie w pionie na środku
    notification.style.left = "50%"; // Ustawia powiadomienie w poziomie na środku
    notification.style.transform = "translate(-50%, -50%)"; // Przesunięcie o połowę szerokości i wysokości
    notification.style.zIndex = "1000"; // Ustalamy wyższy z-index, aby było na wierzchu
    notification.style.borderRadius = "8px"; // Zaokrąglenie rogów
    notification.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.2)"; // Cień
    document.body.appendChild(notification);
    setTimeout(() => notification.remove(), 3000); // Usuwa  po 3 sekundach
  }

}