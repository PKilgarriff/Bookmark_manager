# Bookmark Manager

[![Build Status](https://app.travis-ci.com/PKilgarriff/Bookmark_manager.svg?branch=main)](https://app.travis-ci.com/PKilgarriff/Bookmark_manager)

A webapp written in Ruby allowing a user to store bookmarks and visit them after viewing a list of all saved bookmarks. Integrates with a PostgreSQL databse to store the required records.

## Domain Modelling

In order to begin behaviour driven development, we created the following user story:

```
As a user
So that I can visit my favourite sites
I'd like to see a list of bookmarks
```

Below is our first domain model in order to start driving the development of the classes.

![First Domain Model](./diagrams/001-BookmarkManager-Domain.png)

After browsing the walkthrough we have also added a process model.

![First Process Model](./diagrams/002-BookmarkManager-Process.jpg)

## Approach

- Create a feature test to display a list of bookmarks
  - Pass by implementing expected string directly in controller
  - refactor to use view
- Created a Unit test for an #all method of the BookmarkList class
- Created Unit tests for #name and #link methods of the Bookmark class
- Refactored to include Model and View in passing the feature test for the list of bookmarks
- Created a testing database
  - Created a helper method to setup the database
  - and one to add default bookmarks
--------
- Split database_connection_and_setup into two methods
  - refactor conditional into ternary
- Added SimpleCov for checking test coverage
- Update BookmarkList class
  - renamed all to all_bookmarks
  - return value is now a PG::Result object
  - updated controller and view to reflect this change


## Database setup

```
CREATE DATABASE bookmark_manager;
\c bookmark_manager;
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));
\dt
```
