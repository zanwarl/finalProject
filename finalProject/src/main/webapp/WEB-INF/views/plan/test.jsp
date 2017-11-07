<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>Pikaday</title>
    <meta name="author" content="David Bushell">
    <link rel="stylesheet" href="css/pikaday.css">
    <link rel="stylesheet" href="css/site.css">
</head>
<body>
	<div id="wrap">
    	<input type="text" id="datepicker">
    </div>
    <script src="js/pikaday.js"></script>
    <script>

    var picker = new Pikaday(
    {
        field: document.getElementById('datepicker'),
        firstDay: 1,
        minDate: new Date(),
        maxDate: new Date(2020, 12, 31),
        yearRange: [2000,2020]
    })
    window.alert("d");
    ;

    </script>
</body>
</html>
