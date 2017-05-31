# README


* Rails version `5.1.1`

* Ruby version `2.4.0`

* System dependencies

* Database ~SQLite3~ POSTGRES

* How to run the test suite

## Notes
- First time I've implemented React. Further research is necessary to cross-reference patterns and syntax used to ensure it conforms with React community best practices.
- From the job description it appeared you weren't using PostgreSQL, so I used SQLite for simplicity. As the data is stored in a hash / json type object, any NoSQL or SQL database could be configured as the datastore.
- Currently loading jQuery merely to handle AJAX requests, which is a little like bringing a bazooka to a water gun fight. If jQuery continues to only be used for this isolated functionality, it would be preferred to omit jQuery in favor of a slimmer AJAX library (superagent, axios, react-ajax, reqwest, et al).


<!-- Bootstrap -->
// http://getbootstrap.com/examples/sticky-footer-navbar/
http://getbootstrap.com/examples/sticky-footer-navbar/


- Tried to set it up with React. Got as far as setting up the views and AJAX CRUD actions (check out app/assets/javascripts/components/*) however I discovered my lack of React knowledge (specifically manipulating the data structure to create a complex view whereby the hash was mapped to a table, with the hash values exposed as inputs) was a serious impediment to my ability to finish the assignment on schedule.
- Backed out of API land, back into Rails view land.
- Now that I was really in a time crunch, I switched the DB from SQLite to Postgres because I wanted to take advantage Postgres's built-in handling of JSON (rather than manually converting the data into and out of JSON with every GET / PUT).

- Don't like putting an entire table into a form