<!DOCTYPE html>
<html>
<head>
    <title>Edit Dog</title>
</head>
<body>
    <h1>Edit Dog</h1>
    <form action="/dogs/edit/{{ dog[0] }}" method="post">
        <label for="dog_name">Name:</label>
        <input type="text" id="dog_name" name="dog_name" value="{{ dog[1] }}"><br><br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="{{ dog[2] }}"><br><br>
        <label for="breed_id">Breed:</label>
        <select id="breed_id" name="breed_id">
            % for breed in breeds:
                <option value="{{ breed[0] }}" {% if breed[0] == dog[3]: %} selected {% end %}>{{ breed[1] }}</option>
            % end
        </select><br><br>
        <input type="submit" value="Update Dog">
    </form>
    <p><a href="/dogs">Back to Dogs</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
