export default Ember.Route.extend({
  model: function(){
    return this.store.createRecord('topic');
  },
  actions: {
    save: function(topic) {
      var _this = this;
      topic.save().then(function (){
        _this.transitionTo('topics.index');
      });
    }
  }
});
