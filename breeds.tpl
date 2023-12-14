<!DOCTYPE html>
<html>
<head>
    <title>View Breeds</title>
</head>
<body>
    <h1>Breeds</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            % for breed in rows:
                <tr>
                    <td>{{ breed[0] }}</td>
                    <td>{{ breed[1] }}</td>
                    <td>
                        <a href="/breeds/edit/{{ breed[0] }}">Edit</a>
                        <a href="/breeds/delete/{{ breed[0] }}">Delete</a>
                    </td>
                </tr>
            % end
        </tbody>
    </table>
    <p><a href="/breeds/add">Add Breed</a></p>
    <p><a href="/">Back to Home</a></p>
</body>
</html>
