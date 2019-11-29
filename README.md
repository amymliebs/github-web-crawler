# Github Trending Crawler

This application collects information from the current Github trending repositories available at: https://github.com/trending?since=weekly. Collected data includes the name, description, primary coding language, and the usernames of primary contributors.

### View Online

To seed the database with today's trending articles on Github run:
```
rake db:create
rake db:migrate
rake db:seed
```

To view a webpage with a printout of today's trending articles on Github on a webpage, go to
```
localhost:3000
```

### View in Terminal

To view the data in your terminal, run:
```
ruby print_to_terminal.rb
```

### View JSON Data

To view the JSON data, start a rails server by running the command `rails s`.
The JSON data can be found at: `/api/v1/repositories`.
