import databaseCleaner from '../helpers/database-cleaner';
import startApp from '../helpers/start-app';

var App;
module('Integration - Viewing people', {
  setup: function(){
    App = startApp();
  },
  teardown: function() {
    databaseCleaner();
    Ember.run(App, 'destroy');
  }
});

test('Allows the user to see the people', function(){
  expect(1);

  visit('/').then(function(){

    click('a:contains("People")');

    andThen(function() {
      var dan = find('li:contains("Dan McClain")');
      equal(dan.length, 1, 'Expected to find Dan');
    });
  });
});
