<!DOCTYPE html>
<html>
<head>
    <title>Add Dog</title>
</head>
<body>
    <h1>Add Dog</h1>
    <form action="/dogs/add" method="post">
        <label for="dog_name">Name:</label>
        <input type="text" id="dog_name" name="dog_name"><br><br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age"><br><br>
        <label for="breed_id">Breed:</label>
        <select id="breed_id" name="breed_id">
            % for breed in breeds:
                <option value="{{ breed[0] }}">{{ breed[1] }}</option>
            % end
        </select><br><br>
        <input type="submit" value="Add Dog">
    </form>
    <p><a href="/dogs">Back to Dogs</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
