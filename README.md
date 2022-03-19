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
- Extracted database-related methods from BookmarkList into DatabaseManager class
  - now has class methods
    - .setup
    - .connection
    - .query
- Create new User Story 'add new bookmarks'
  - test-drive add_bookmark method for BookmarkList class
    - unit test for general response
    - then feature test to integrate into Controller
  - Added new view new_bookmark.erb
  - added get and post routes for /new-entry
  - Updated Home Page feature test to reflect new navigation buttons and use of index.erb
- Mocked PG dependency of DatabaseManager class
- Rewrote view to use url as href in link instead of as text
- Restructure return objects from database
  - already had title and url in database
  - need to create new object (Bookmark) to encapsulate the bookmark data
- Update SQL queries to use exec_params instead of exec
  - minimise risk of SQL injection

## Database setup

```
CREATE DATABASE bookmark_manager;
\c bookmark_manager;
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60));
\dt
```

## User Stories

```
As a user
So that I can visit my favourite sites
I'd like to see a list of bookmarks
```

```
As a user
So that I keep a record of new favourite sites
I'd like to be able to add a new bookmark
```
