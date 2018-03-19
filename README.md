# precinct-explorer

This is the Precinct Explorer tool, created at the Geometry of Redistricting Hackathon on 2018-03-18.

How to set up:

The API is in Flask right now and the front end is in node.js. This is not intentional! @radiantradon plans to move the back-end API to node to remove the python dependencies.

1. Clone this repo to your computer: `git clone git@github.com:radiantradon/precinct-explorer.git`
2. Set up a python virtual environment called precinctexplorer
3. run pip install -r requirements.txt inside your python virtualenv
4. copy envvars-template to a file called envvars (`envvars` is under `.gitignore` so it won't get checked into github)
5. email radiantradon@gmail.com (Katherine) or mookerji@gmail.com (Buro) for access to the database
6. run `flask run`
7. the Flask API is now running at `http://127.0.0.1:5000`

Set up the front end:

8. run `npm install` to install the node dependencies
9. run `npm run` (make sure `MapboxAccessToken` is an environment variable)
10. your site should be at `http://127.0.0.1:8080`


