<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Lettura dati ThingSpeak</title>
</head>
<body>
    <div class="card">
        <h1>Dati sulle temperature</h1>
        <?php
            $channelID = "2964228";
            $readAPIKey = "";
            $results = 1;

            $url = "https://api.thingspeak.com/channels/2964228/feeds.json?results=1";
            if (!empty($readAPIKey)) {
                $url .= "&api_key=$readAPIKey";
            }

            $response = file_get_contents($url);
            if ($response === FALSE) {
                echo "<p>Errore nella richiesta a ThingSpeak.</p>";
                exit;
            }

            $data = json_decode($response, true);

            if (!empty($data["feeds"])) {
    echo "<div class='table-container'>";
    echo "<table class='responsive-table'>";
    echo "<tr><th>Timestamp</th><th>Sensore1</th><th>Sensore2</th></tr>";

    foreach ($data["feeds"] as $feed) {
        $timestamp = htmlspecialchars($feed["created_at"]);
        $field2 = floatval($feed["field2"]);
        $field4 = floatval($feed["field4"]);

        echo "<tr>";
        echo "<td>$timestamp</td>";
        echo "<td>$field2</td>";
        echo "<td>$field4</td>";
        echo "</tr>";

        // Definizione dei range di temperatura
        $min1 = isset($tempMin1) ? $tempMin1 : 20;
        $max1 = isset($tempMax1) ? $tempMax1 : 30;
        $min2 = isset($tempMin2) ? $tempMin2 : 20;
        $max2 = isset($tempMax2) ? $tempMax2 : 30;

        // Verifica se le temperature sono in range
        $status1 = ($field2 >= $min1 && $field2 <= $max1) ? "<span style='color:green'>In range</span>" : "<span style='color:red'>Out of range</span>";
        $status2 = ($field4 >= $min2 && $field4 <= $max2) ? "<span style='color:green'>In range</span>" : "<span style='color:red'>Out of range</span>";

        echo "<tr>";
        echo "<td><strong>Stato</strong></td>";
        echo "<td>$status1</td>";
        echo "<td>$status2</td>";
        echo "</tr>";
    }

    echo "</table>";
    echo "</div>";
} else {
    echo "<p>Nessun dato disponibile.</p>";
}
        ?>
    </div>

    <!-- Timer multipli -->
    <div id="timers-container" class="card">
        <h2>Imposta uno o più Timer</h2>
        <input type="number" id="minuti" placeholder="Minuti" min="1">
        <button onclick="avviaTimer()">Start Timer</button>

        <div id="lista-timer"></div>
    </div>

    <script>
    if (Notification.permission !== "granted") {
        Notification.requestPermission();
    }

    let timerCount = 0;
    const intervalli = {}; // per tenere traccia degli intervalli attivi

    function avviaTimer() {
        const minuti = parseInt(document.getElementById("minuti").value);
        if (isNaN(minuti) || minuti <= 0) {
            alert("Inserisci un numero di minuti valido.");
            return;
        }

        let secondi = minuti * 60;
        const idTimer = "timer-" + (++timerCount);

        const container = document.getElementById("lista-timer");
        const blocco = document.createElement("div");
        blocco.className = "timer-block";
        blocco.id = idTimer;
        blocco.innerHTML = `
            <div class ="timerCircondato">
                <strong>Timer ${timerCount}</strong><br>
                <span>Tempo rimanente: ${minuti}m 0s</span><br>
                <button class="delete-btn" onclick="eliminaTimer('${idTimer}')">Elimina Timer</button>
            </div>
        `;

        container.appendChild(blocco);

        const span = blocco.querySelector("span");

        intervalli[idTimer] = setInterval(() => {
            const m = Math.floor(secondi / 60);
            const s = secondi % 60;
            span.textContent = `Tempo rimanente: ${m}m ${s}s`;

            if (secondi <= 0) {
                clearInterval(intervalli[idTimer]);
                span.textContent = "⏰ Timer scaduto!";
                inviaNotifica("Timer " + timerCount, "⏰ Il timer impostato è terminato!");
            }

            secondi--;
        }, 1000);
    }

    function eliminaTimer(idTimer) {
        clearInterval(intervalli[idTimer]);
        delete intervalli[idTimer];
        const blocco = document.getElementById(idTimer);
        if (blocco) {
            blocco.remove();
        }
    }

    function inviaNotifica(titolo, messaggio) {
        if (Notification.permission === "granted") {
            new Notification(titolo, {
                body: messaggio,
                icon: "https://cdn-icons-png.flaticon.com/512/992/992700.png"
            });
        } else {
            alert(messaggio);
        }
    }
    </script>
</body>
</html>