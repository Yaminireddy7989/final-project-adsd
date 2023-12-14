<!DOCTYPE html>
<html>
<head>
    <title>View Movies</title>
</head>
<body>
    <h1>Movies</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>  
                <th>Year</th>
                <th>Genre</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            % for movie in rows:
                <tr>
                    <td>{{ movie[0] }}</td>
                    <td>{{ movie[1] }}</td>
                    <td>{{ movie[2] }}</td>
                    <td>{{ movie[3] }}</td>
                    <td>
                        <a href="/movies/edit/{{ movie[0] }}">Edit</a>
                        <a href="/movies/delete/{{ movie[0] }}">Delete</a>
                    </td>
                </tr>
            % end
        </tbody>
    </table>
    <p><a href="/movies/add">Add Movie</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
