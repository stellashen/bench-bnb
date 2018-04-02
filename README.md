# BenchBnB

After git clone, please run the following commands:
```
$ cd bench-bnb
$ bundle install
$ npm install
$ npm run webpack
$ be rails db:reset
$ rails s
```

`$ npm run webpack` runs webpack --watch, and updates any javascript changes.
`$ rails s` opens rails server.
Note: Keep these two terminal tabs open for runnning webpack watch and rails server.

Then open browser and go to:
http://localhost:3000/

jsx entry file:
frontend/bench_bnb.jsx

html homepage:
app/biews/static_pages/root.html.erb
layout:
app/views/layouts/application.html.erb
