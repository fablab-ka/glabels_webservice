<html>
<head>
    <title>Simple Label Printer</title>
    <style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
    </style>
</head>
<body>

<form action="/print" method="post" id="print_form">
    <h4>Number of Copies</h4>
    <input type="number" name="quantity" value="1" min="1" max="50" step="1" required>
    <h4>Text to print</h4>
    <textarea name="text" form="print_form" placeholder="text" required></textarea>
    <br><br>
    <input type="submit" value="print">
</form>

</body>

</html>