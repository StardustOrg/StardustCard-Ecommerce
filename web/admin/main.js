/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/**
 * Esta função é utilizada para ocultar e visualizar
 * o sidebar quando o tamanho da tela estiver pequeno
 */
function toggleSidebar() {
    var sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("active");
}

/**
 * Gráficos
 */
document.addEventListener("DOMContentLoaded", function () {
    var ctxMonthlyReport = document
            .getElementById("monthlyReport")
            .getContext("2d");
    var ctxWeekSales = document.getElementById("weekSales").getContext("2d");

    // Gráfico de linha (Monthly Report)
    new Chart(ctxMonthlyReport, {
        type: "line",
        data: {
            labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul"],
            datasets: [
                {
                    label: "Faturamento Mensal",
                    data: [1500, 1800, 1200, 2000, 1400, 1600, 1700],
                    borderColor: "#6622CC",
                    borderWidth: 2,
                    fill: false,
                },
            ],
        },
        options: {
            scales: {
                x: {
                    display: false,
                },
                y: {
                    display: false,
                },
            },
            plugins: {
                legend: {
                    display: false,
                },
            },
        },
    });

    // Gráfico de barras (Week Sales)
    var weekSalesChart = new Chart(ctxWeekSales, {
        type: "bar",
        data: {
            labels: ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
            datasets: [
                {
                    label: "Vendas na Semana",
                    data: [12, 19, 3, 5, 2, 3, 10],
                    backgroundColor: "#8EDCE6",
                    borderColor: "#8EDCE6",
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                x: {
                    display: false,
                },
                y: {
                    display: false,
                },
            },
            plugins: {
                legend: {
                    display: false,
                },
            },
            onHover: function (event, elements) {
                if (elements.length > 0) {
                    var index = elements[0].index;
                    weekSalesChart.data.datasets[0].backgroundColor[index] = "#E1B4F4";
                    weekSalesChart.data.datasets[0].borderColor[index] = "#E1B4F4";
                    weekSalesChart.update();
                } else {
                    weekSalesChart.data.datasets[0].backgroundColor =
                            Array(7).fill("#8EDCE6");
                    weekSalesChart.data.datasets[0].borderColor =
                            Array(7).fill("#8EDCE6");
                    weekSalesChart.update();
                }
            },
        },
    });
});

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

function filterFunction() {
    var input, filter, ul, li, a, i;
    filter = input.value.toUpperCase();
    div = document.getElementById("myDropdown");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        txtValue = a[i].textContent || a[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}

/**
 * Box Shadow for input image
 */


//Modal
const modal = document.querySelector(".modal");
const openModalBtn = document.querySelector(".add-new");
const closeModalBtn = document.querySelector(".btn-close");

const closeModal = function () {
    modal.classList.add("hidden");
};

closeModalBtn.addEventListener("click", closeModal);

document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && !modal.classList.contains("hidden")) {
        closeModal();
    }
});

const openModal = function () {
    modal.classList.remove("hidden");
};

openModalBtn.addEventListener("click", openModal);


// Selecione o elemento de entrada de URL da imagem e a tag de imagem
var urlInput = document.getElementById("photocard-url");
var imgElement = document.getElementById("photcard-input");

// Adicione um ouvinte de evento de mudança ao campo de entrada da URL
urlInput.addEventListener("input", function () {
    changeImg();
});

// Função para mudar a imagem
function changeImg() {
    console.log("Olá");
    var imageUrl = urlInput.value;
    imgElement.src = imageUrl;

    imgElement.style.width = "100%";
    imgElement.style.height = "100%";
    imgElement.style.objectFit = "cover";
}