function databaseCleaner() {
  jQuery.ajax('/tests/cleaner', {
    async: false,
    type: 'POST'
  });
}

export default databaseCleaner;
