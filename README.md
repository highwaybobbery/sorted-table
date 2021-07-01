# This is a ROR app with embedded React that allows users to view and sort delimited files
The files must use either ',' or '|' as a column delimiter.
The column headings are hard coded to Full Name, Email Vehicle Type, Vehicle Name, and Vehicle Length
The input file should have two separate columns for first and last name, they get combined for presentation.
No header row is expected in the file, all rows should be data.
Only the Vehicle Type and Full Name columns are sortable.
Example files can be found in spec/support/attachments/

## Stack
* Bundler 2.2
* Ruby 3.0.1
* Rails 6.1.4
* Rspec 3.10
* Node 14.17.1
* Yarn

(there is no database or caching technology used)

## Setup
1) Clone this repo
1) Within root directory of the application:
    1) Ensure you have ruby 3.0.1 installed and activated `ruby -v`
    1) Ensure bundler is intalled with a recent version `gem install bundler -v '>=2.2`)
    1) Ensure Node 14.17.1 is installed `nvm install 14.17.1`
    1) Ensure Yarn is installed `npm install --global yarn`
    1) Install required gems with `bundle install`
   
## Testing
This project uses rspec for testing
Run tests with `bundle exec rspec spec`
TODO: Add unit and integration tests for the client side behavior

## Running the App
The app can be started with `bundle exec rails s`
