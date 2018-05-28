const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");

$(()=> {
  let btns = $('button.follow-toggle');
  btns.each((_, btn) => {
    new FollowToggle($(btn));
  });

  let searches = $('nav.users-search');
  searches.each((_, search) => {
    new UsersSearch($(search));
  });

});
