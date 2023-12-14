<!DOCTYPE html>
<html>
<head>
    <title>Edit Genre</title>
</head>
<body>
    <h1>Edit Genre</h1>
    <form action="/genres/edit/{{ genre[0] }}" method="post">
        <label for="genre_name">Name:</label>
        <input type="text" id="genre_name" name="genre_name" value="{{ genre[1] }}"><br><br>
        <input type="submit" value="Update Genre">
    </form>
    <p><a href="/genres">Back to Genres</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
