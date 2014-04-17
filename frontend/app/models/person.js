var attr = DS.attr;

export default DS.Model.extend({
  firstName: attr(),
  lastName: attr(),
  description: attr()
});
