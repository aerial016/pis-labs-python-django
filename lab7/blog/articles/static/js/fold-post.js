var foldBtns = document.getElementsByClassName("fold-button");
for (var i = 0; i < foldBtns.length; i++) {
    foldBtns[i].addEventListener("click", function (event) {
        console.log("you clicked ", event.target);
        var folded = event.target.parentElement.classList.toggle("folded");
        event.target.textContent = folded ? "развернуть" : "свернуть";
        event.target.setAttribute("aria-expanded", String(!folded));
    });
}
