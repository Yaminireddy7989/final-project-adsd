<!DOCTYPE html>
<html>
<head>
    <title>View Dogs</title>
</head>
<body>
    <h1>Dogs</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Breed</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            % for dog in rows:
                <tr>
                    <td>{{ dog[0] }}</td>
                    <td>{{ dog[1] }}</td>
                    <td>{{ dog[2] }}</td>
                    <td>{{ dog[3] }}</td>
                    <td>
                        <a href="/dogs/edit/{{ dog[0] }}">Edit</a>
                        <a href="/dogs/delete/{{ dog[0] }}">Delete</a>
                    </td>
                </tr>
            % end
        </tbody>
    </table>
    <p><a href="/dogs/add">Add Dog</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
