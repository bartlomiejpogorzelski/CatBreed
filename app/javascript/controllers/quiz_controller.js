import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "element", "nextButton", "previousButton", "result", "navigation"]

  connect() {
    this.currentQuizIndex = 0;
    this.correctAnswers = 0; // Count correct answers
    this.totalQuestions = this.elementTargets.length; // Count of questions
    this.elementTargets.forEach(element => {
      element.querySelectorAll("input[type='radio']").forEach(input => {
          input.checked = false; // Restart checked
      });
    });

    this.showQuiz(this.currentQuizIndex);
  }

  showQuiz(index) {
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
    if (this.currentQuizIndex < this.totalQuestions - 1) {
      this.currentQuizIndex++;
      this.showQuiz(this.currentQuizIndex);
    } else {
      this.showResult(); // Finish quiz and show result
    }
  }

  previousQuiz() {
    if (this.currentQuizIndex > 0) {
      this.currentQuizIndex--;
      this.showQuiz(this.currentQuizIndex);
    }
  }

  updateNavigationButtons() {
    if (this.currentQuizIndex === 0) {
      this.hidePreviousButton();
    } else {
      this.showPreviousButton();
    }

    // For last question/quiz
    if (this.currentQuizIndex === this.totalQuestions - 1) {
      this.nextButtonTarget.textContent = "Finish";
    } else {
      this.nextButtonTarget.textContent = "Next";
    }
  }

  hidePreviousButton() {
    this.previousButtonTarget.classList.add("invisible"); 
  }

  showPreviousButton() {
    this.previousButtonTarget.classList.remove("invisible");
  }

  selectOption(event) {
    event.preventDefault();

    const correctAnswer = event.target.dataset.correctAnswer;
    const form = event.target.closest("form");

    // Block options to chose
    form.querySelectorAll("input[type='radio']").forEach(input => {
      input.disabled = true;
    });

    const selectedAnswerText = event.target.nextElementSibling.textContent.trim();

    // Check correct anserws
    if (selectedAnswerText === correctAnswer) {
      this.correctAnswers++; // Add correct answer
      this.showCorrect(event.target);
    } else {
      this.showIncorrect(event.target);
    }
  }

  showCorrect(target) {
    target.nextElementSibling.classList.add("bg-green-500", "text-white");
    this.showNotification("Poprawna odpowiedź!", "green");
  }

  showIncorrect(target) {
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
    notification.style.top = "50%";
    notification.style.left = "50%";
    notification.style.transform = "translate(-50%, -50%)";
    notification.style.zIndex = "1000";
    notification.style.borderRadius = "8px";
    notification.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.2)";
    document.body.appendChild(notification);
    setTimeout(() => notification.remove(), 3000);
  }

  showResult() {
    // Hidden quizes
    this.elementTargets.forEach(element => element.classList.add("hidden"));
    
    // hidden bottoms 
    this.navigationTarget.classList.add("hidden");

    // Show result
    this.resultTarget.classList.remove("hidden");

    const resultMessage = `Your result: ${this.correctAnswers} z ${this.totalQuestions}`;
    this.resultTarget.querySelector("p").textContent = resultMessage;
  }

  // restartQuiz() {
  //   // Resetowanie wyniku i ustawień
  //   this.clearResults();
  //   this.currentQuizIndex = 0;

  //   // Użyj Fetch API do załadowania nowych quizów
  //   fetch('/quizzes') // Wywołaj URL, który renderuje nową stronę z quizami
  //       .then(response => response.text()) // Oczekujemy tekstu HTML
  //       .then(html => {
  //           // Zaktualizuj DOM z nowymi quizami
  //           document.querySelector('.quiz-list-container').innerHTML = html; // Upewnij się, że masz odpowiedni kontener
  //           this.connect(); // Ponownie połącz kontroler, aby zainicjować nowe quizy
  //       })
  //       .catch(error => console.error('Error loading quizzes:', error));
  // }

  // clearResults() {

  // }


}
