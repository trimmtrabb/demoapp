## API endpoints for cursor pagination & uploaded video processing.
##### Rails version: 7.0.4.2
##### Ruby version: 3.2.0

### 1. Cursor pagination
#### An API allowing you to sort & filter records according to your needs.

Running seeds will populate the database with 100 notifications:

    rails db:seed

Start the server by running this command in Terminal:

    > puma

The list can be tweaked using parameters, see the example below:

    /api/v1/notifications?order=asc&size=5&cursor[nav_dir]=after&cursor[pointer]=12

Nevertheless, accessing the URL with no parameters will load the list as well,
as the defaults are set to:

    /notifications?order=asc&size=10&cursor[nav_dir]=after&cursor[pointer]=-1
--------------

Use
`order=asc` & `order=desc` to specify order,
`size=5..100` to specify the limit (whatever limit you choose),
`cursor[nav_dir]=before` or `cursor[nav_dir]=after` (here you require the previous / next page)
`cursor[pointer]=12` to define the record serving as a cursor, using its ID.

So, when you want to request the next 5 records following the record with ID=15,
you simply send the following params:

    /notifications?size=5&cursor[nav_dir]=after&cursor[pointer]=15
