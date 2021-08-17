
window.addEventListener("load", () => {
    // btn onsubmit
    const form = document.querySelector("#search_form");
    form.addEventListener("submit", (event) => {
        if(!document.querySelector('#city').value) {
            event.preventDefault();
            event.stopPropagation();
        };
        form.classList.add('was-validated');
    });
});

function select_city(city){
    const form = document.querySelector("#search_form");
    document.querySelector('#city').value = city;
    form.submit();
}
