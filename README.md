ember-cli-plus-backend
======================

This is an example of various ember-cli + backend API setups (the API in this case being provided by Rails, but it's interchangeable).

Prerequisites
------

- [Ember-cli](//github.com/stefanpenner/ember-cli)
  - `npm install -g ember-cli`
- [bower](//github.com/bower/bower)
  - `npm install -g bower`


Setup
------

1 - Ensure you have the prerequisites installed globally (see above)

2 - Navigate to your desired project directory and clone the repo:

```
git clone git@github.com:dockyard/ember-cli-plus-backend.git
```

3 - Navigate into the frontend directory and install the packages:

```
cd ember-cli-plus-backend
cd frontend
npm install
bower install
```

4 - Navigate into the backend directory and the gems:

```
cd ../
cd backend
bundle install
```
