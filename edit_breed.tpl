<!DOCTYPE html>
<html>
<head>
    <title>Edit Breed</title>
</head>
<body>
    <h1>Edit Breed</h1>
    <form action="/breeds/edit/{{ breed[0] }}" method="post">
        <label for="breed_name">Name:</label>
        <input type="text" id="breed_name" name="breed_name" value="{{ breed[1] }}"><br><br>
        <input type="submit" value="Update Breed">
    </form>
    <p><a href="/breeds">Back to Breeds</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
