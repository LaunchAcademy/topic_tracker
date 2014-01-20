export default Ember.Route.extend({
  model: function(){
    return this.get('topic');
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
