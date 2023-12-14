<!DOCTYPE html>
<html>
<head>
    <title>Add Breed</title>
</head>
<body>
    <h1>Add Breed</h1>
    <form action="/breeds/add" method="post">
        <label for="breed_name">Name:</label>
        <input type="text" id="breed_name" name="breed_name"><br><br>
        <input type="submit" value="Add Breed">
    </form>
    <p><a href="/breeds">Back to Breeds</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
