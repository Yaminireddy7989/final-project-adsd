<!DOCTYPE html>
<html>
<head>
    <title>Add Movie</title>
</head>
<body>
    <h1>Add Movie</h1>
    <form action="/movies/add" method="post">
        <label for="movie_name">Name:</label>
        <input type="text" id="movie_name" name="movie_name"><br><br>
        <label for="year">Year:</label>
        <input type="number" id="year" name="year"><br><br>
        <label for="genre_id">Genre:</label>
        <select id="genre_id" name="genre_id">
            % for genre in genres:
                <option value="{{ genre[0] }}">{{ genre[1] }}</option>
            % end
        </select><br><br>
        <input type="submit" value="Add Movie">
    </form>
    <p><a href="/movies">Back to Movies</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
