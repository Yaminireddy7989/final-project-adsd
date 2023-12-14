<!DOCTYPE html>
<html>
<head>
    <title>View Genres</title>
</head>
<body>
    <h1>Genres</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            % for genre in rows:
                <tr>
                    <td>{{ genre[0] }}</td>
                    <td>{{ genre[1] }}</td>
                    <td>
                        <a href="/genres/edit/{{ genre[0] }}">Edit</a>
                        <a href="/genres/delete/{{ genre[0] }}">Delete</a>
                    </td>
                </tr>
            % end
        </tbody>
    </table>
    <p><a href="/genres/add">Add Genre</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
