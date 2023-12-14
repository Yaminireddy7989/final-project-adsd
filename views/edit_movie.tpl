<!DOCTYPE html>
<html>
<head>
    <title>Edit Movie</title>
</head>
<body>
    <h1>Edit Movie</h1>
    <form action="/movies/edit/{{ movie[0] }}" method="post">
        <label for="movie_name">Name:</label>
        <input type="text" id="movie_name" name="movie_name" value="{{ movie[1] }}"><br><br>
        <label for="year">Year:</label>
        <input type="number" id="year" name="year" value="{{ movie[2] }}"><br><br>
        <label for="genre_id">Genre:</label>
        <select id="genre_id" name="genre_id">
            % for genre in genres:
                <option value="{{ genre[0] }}" {% if genre[0] == movie[3]: %} selected {% end %}>{{ genre[1] }}</option>
            % end
        </select><br><br>
        <input type="submit" value="Update Movie">
    </form>
    <p><a href="/movies">Back to Movies</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>

