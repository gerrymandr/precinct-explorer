# precinct-explorer

This is the Precinct Explorer tool, created at the Geometry of Redistricting Hackathon on 2018-03-18.

How to set up:

The API is in Flask right now and the front end is in node.js. This is not intentional! @radiantradon plans to move the back-end API to node to remove the python dependencies.

1. Set up a python virtual environment called precinctexplorer
2. run pip install -r requirements.txt inside your python virtualenv
3. copy envvars-template to envvars
4. email radiantradon@gmail.com (Katherine) or mookerji@gmail.com (Buro) for access to the database
5. run `flask run`
6. the API is now running at `http://127.0.0.1:5000`

Set up the front end:

7. run `npm install` to install the node dependencies
8. run `npm run` (make sure `MapboxAccessToken` is an environment variable)
9. your site should be at `http://127.0.0.1:8080`


