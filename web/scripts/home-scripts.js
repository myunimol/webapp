document.addEventListener('polymer-ready', function() {
    /* Questo script serve a far funzionare la tendina per le informazioni
       sulla carriera dello studente
    */
    var studentDetailsButton = document.getElementById("student-detail-button");
    var studentDetailsBox = document.getElementById("student-progress-info");
    studentDetailsButton.addEventListener('click', function() {
        studentDetailsBox.toggle();
        var statusValue = studentDetailsButton.getAttribute("value");
        /* Utilizzo l'attributo "value" per cambiare il testo del bottone */
        if (statusValue === "1") {
            studentDetailsButton.setAttribute("value", "0");
            studentDetailsButton.innerHTML = "NASCONDI DETTAGLI";
        }
        else {
            studentDetailsButton.setAttribute("value", "1");
            studentDetailsButton.innerHTML = "MOSTRA DETTAGLI";
        }
    });
});