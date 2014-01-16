var Router = Ember.Router.extend();

Router.map(function() {
  this.resource('topics', { path: '/' }, function() {
    this.route('new');
  });
});

export default Router;
