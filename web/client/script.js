// SLIDESHOW
let slideIndex = 0;
showSlides(slideIndex);

function currentSlide(n) {
  showSlides((slideIndex = n));
}

// - Interective slideshow
function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("slide");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "flex";
  dots[slideIndex - 1].className += " active";
}

// - Automatic slideshow
function autoSlide() {
  showSlides((slideIndex += 1));
  setTimeout(autoSlide, 5000);
}

autoSlide();

// CAROUSEL OF ARTISTS
const carrousel = document.querySelector(".carrousel");
const artistCards = document.querySelectorAll(".artist-card");
const prevButton = document.querySelector(".arrow-back-ios-new");
const nextButton = document.querySelector(".arrow-forward-ios");

const cardsPerPage = 6;
let currentPage = 0;

// Carousel of artists
function updateCarousel() {
  const startIndex = currentPage * cardsPerPage;
  const endIndex = startIndex + cardsPerPage;

  artistCards.forEach((card, index) => {
    if (index >= startIndex && index < endIndex) {
      card.style.display = "block";
    } else {
      card.style.display = "none";
    }
  });
}

function moveCarousel(direction) {
  currentPage += direction;

  if (currentPage < 0) {
    currentPage = 0;
  }

  const maxPage = Math.ceil(artistCards.length / cardsPerPage) - 1;

  if (currentPage > maxPage) {
    currentPage = maxPage;
  }

  updateCarousel();
}

prevButton.addEventListener("click", () => {
  moveCarousel(-1);
});

nextButton.addEventListener("click", () => {
  moveCarousel(1);
});

updateCarousel();

function validateTextField(value) {
  if (value == null) {
    alert("O elemento não existe");
    return false;
  }
  /* testa se o valor é vazio ou formado por apenas espaços em branco */
  if (value == null || value.length == 0 || (/^\s+$/.test(value))) {
    return false;
  }
  return true;
}

function validateEmail(email) {
  var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
  return emailRegex.test(email);
}

function validateTextFieldLength(value) {
  return value.length >= 6;
}

function validateRegisterForm() {
  var name = document.getElementById('name').value;
  var address = document.getElementById('address').value;
  var email = document.getElementById('email').value;
  var login = document.getElementById('login').value;
  var password = document.getElementById('password').value;
  var confirmPassword = document.getElementById('confirm-password').value;

  if (!validateTextField(name)) {
    alert('Please enter your name.');
    return false;
  } else if (!validateTextField(address)) {
    alert('Please enter your address.');
    return false;
  } else if (!validateEmail(email)) {
    alert('Please enter a valid email address.');
    return false;
  } else if (!validateTextFieldLength(login)) {
    alert('Login must be at least 6 characters.');
    return false;
  } else if (!validateTextFieldLength(password)) {
    alert('Password must be at least 6 characters.');
    return false;
  } else if (!(password === confirmPassword)) {
    alert('Passwords do not match.');
    return false;
  }
  return true;
}