const APIUtil = require('./api_util');

class FollowToggle {
  constructor ($el) {
    this.$el = $el;
    this.userId = $el.data('user-id');
    if ($el.data('initial-follow-state')) {
      this.followState = 'followed';
    } else {
      this.followState = 'unfollowed';
    }

    this.render();
    this.handleClick();
  }

  render() {
    switch(this.followState) {
      case 'followed':
        this.$el.text("Unfollow!");
        this.$el.prop("disabled", false);
        break;
      case 'unfollowed':
        this.$el.text("Follow!");
        this.$el.prop("disabled", false);
        break;
      case 'following':
        this.$el.text("Following!");
        this.$el.prop("disabled", true);
        break;
      case 'unfollowing':
        this.$el.text("Unfollowing!");
        this.$el.prop("disabled", true);
        break;
    }

  }

  handleClick() {

    this.$el.on('click', (e) => {
      e.preventDefault();

      switch (this.followState) {
        case 'followed':
          this.followState = "unfollowing";
          this.render();

          return APIUtil.unfollowUser(this.userId)
            .then(() => {
              this.followState = "unfollowed";
              this.render();
            }, () => console.log('fail'));

        case 'unfollowed':
          this.followState = "following";
          this.render();

          return APIUtil.followUser(this.userId)
            .then(() => {
              this.followState = "followed";
              this.render();
            }, () => console.log('fail'));
      }

    });
  }
}


module.exports = FollowToggle;
