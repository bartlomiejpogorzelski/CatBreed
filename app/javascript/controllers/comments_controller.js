import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
  connect() {}

  toggleForm(event) { 
    console.log("Click Edit b");    

    event.preventDefault();
    event.stopPropagation();
    console.log("params: ", JSON.stringify(event.params));
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const editButtonID = event.params["edit"];

    const form = document.getElementById(formID);
    const commentBody = document.getElementById(commentBodyID);
    const editButton = document.getElementById(editButtonID);

    form.classList.toggle("hidden");
    form.classList.toggle("mt-5");
    commentBody.classList.toggle("hidden");
    this.toggleEditButton(editButton);
  }

  toggleEditButton(editButton) {
    if (editButton.innerText === "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle("bg-gray-500");
    editButton.classList.toggle("bg-yellow-500");
  }

}