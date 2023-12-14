<!DOCTYPE html>
<html>
<head>
    <title>Add Genre</title>
</head>
<body>
    <h1>Add Genre</h1>
    <form action="/genres/add" method="post">
        <label for="genre_name">Name:</label>
        <input type="text" id="genre_name" name="genre_name"><br><br>
        <input type="submit" value="Add Genre">
    </form>
    <p><a href="/genres">Back to Genres</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
