// async function fetchDestinations() {
//   try {
//     const response = await fetch("http://localhost:911/users/login"); // Ganti dengan URL API Anda
//     const data = await response.json();

//     const datalist = document.getElementById("datalist");
//     data.forEach((destination) => {
//       const item = document.createElement("div");
//       item.className = "autocomplete-item";
//       item.textContent = destination;

//       item.addEventListener("click", () => {
//         document.getElementById("destinasi").value = destination;
//         datalist.innerHTML = "";
//       });

//       datalist.appendChild(item);
//     });
//   } catch (error) {
//     console.error("Error fetching destinations:", error);
//   }
// }

// function validate() {
//   const selectedActivities = document.querySelectorAll(
//     ".activity-option.selected"
//   );
//   const selectedPerson = document.querySelector(".person.selected");
//   const selectedAnggaran = document.querySelector(".option-anggaran.selected");
//   const destinasi = document.getElementById("destinasi").value;
//   const date = document.getElementById("datePicker").value;
//   const days = parseInt(document.querySelector(".num").innerText);

//   if (!destinasi) {
//     alert("Harap pilih terlebih dahulu destinasi Anda!");
//     return;
//   }

//   if (!date) {
//     alert("Harap pilih tanggal keberangkatan Anda!");
//     return;
//   }

//   if (!selectedAnggaran) {
//     alert("Harap pilih terlebih dahulu anggaran Anda!");
//     return;
//   }

//   if (!selectedPerson) {
//     alert("Harap pilih terlebih dahulu jumlah orang yang pergi!");
//     return;
//   }

//   if (selectedActivities.length <= 0) {
//     alert("Harap pilih terlebih dahulu aktivitas yang diinginkan!");
//     return;
//   }

//   const activities = Array.from(selectedActivities).map(
//     (activity) => activity.querySelector("h3").innerText
//   );
//   const person = selectedPerson.querySelector("h3").innerText;
//   const anggaran = selectedAnggaran.querySelector("h3").innerText;

//   const tripData = {
//     "destinasi": destinasi,
//     "date": date,
//     "days": days,
//     "anggaran": anggaran,
//     "person": person,
//     "activities": activities,
//   };

//   fetch("/plan", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//     },
//     body: JSON.stringify(tripData),
//   })
//     .then((response) => response.json()) // Assuming your backend sends JSON response
//     .then((data) => {
//       // Save trip data to local storage or session storage
//       // sessionStorage.setItem("tripData", tripData);
//       sessionStorage.setItem("destinasi", tripData.destinasi);
//       sessionStorage.setItem("date", tripData.date);
//       sessionStorage.setItem("days", tripData.days);
//       sessionStorage.setItem("anggaran", tripData.anggaran);
//       sessionStorage.setItem("person", tripData.person);
//       sessionStorage.setItem("activities", JSON.stringify(tripData.activities));

//       // Redirect to result page
//       window.location.href = "/testai.html";
//     })
//     .catch((error) => {
//       console.error("Error:", error);
//     });
// }


function validate() {
  const selectedActivities = document.querySelectorAll(".activity-option.selected");
  const selectedPerson = document.querySelector(".person.selected");
  const selectedAnggaran = document.querySelector(".option-anggaran.selected");
  const destinasi = document.getElementById("destinasi").value;
  const date = document.getElementById("datePicker").value;
  const days = parseInt(document.querySelector(".num").innerText);

  if (!destinasi) {
    alert("Harap pilih terlebih dahulu destinasi Anda!");
    return;
  }

  if (!date) {
    alert("Harap pilih tanggal keberangkatan Anda!");
    return;
  }

  if (!selectedAnggaran) {
    alert("Harap pilih terlebih dahulu anggaran Anda!");
    return;
  }

  if (!selectedPerson) {
    alert("Harap pilih terlebih dahulu jumlah orang yang pergi!");
    return;
  }

  if (selectedActivities.length <= 0) {
    alert("Harap pilih terlebih dahulu aktivitas yang diinginkan!");
    return;
  }

  const activities = Array.from(selectedActivities).map(activity => activity.querySelector("h3").innerText);
  const person = selectedPerson.querySelector("h3").innerText;
  const anggaran = selectedAnggaran.querySelector("h3").innerText;

  const tripData = {
    "destinasi": destinasi,
    "date": date,
    "days": days,
    "anggaran": anggaran,
    "person": person,
    "activities": activities,
  };

  // Save trip data to session storage
  sessionStorage.setItem("destinasi", tripData.destinasi);
  sessionStorage.setItem("date", tripData.date);
  sessionStorage.setItem("days", tripData.days);
  sessionStorage.setItem("anggaran", tripData.anggaran);
  sessionStorage.setItem("person", tripData.person);
  sessionStorage.setItem("activities", JSON.stringify(tripData.activities));

  // Redirect to result page
  window.location.href = "Testai.html";
}


// document.addEventListener("DOMContentLoaded", fetchDestinations);

src =
  "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js";


