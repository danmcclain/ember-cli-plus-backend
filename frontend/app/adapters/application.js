export default DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',
  headers: Ember.computed(function(){
    var token = Ember.$('meta[name="csrf-token"]').attr('content');
    return {"X-CSRF-Token": token};
  })
});
