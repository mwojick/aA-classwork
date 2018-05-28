const APIUtil = require('./api_util');

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.input = $el.find('input');
    this.ul = $el.find('ul.users');

    this.handleInput();
  }

  handleInput() {
    this.$el.on('input', (e) => {
      e.preventDefault();

      let queryVal = this.input.val();
      APIUtil.searchUsers(queryVal, (res) => {
        this.renderResults(res);
      });

    });
  }

  renderResults(res) {
    this.ul.empty();
    console.log(res);
  }
}

module.exports = UsersSearch;
