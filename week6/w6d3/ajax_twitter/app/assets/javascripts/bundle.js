/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    // ...
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: "json"
    });

  },

  unfollowUser: id => {
    // ...
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: "json"
    });

  },


  searchUsers: (queryVal, success) => {

    return $.ajax({
      method: 'GET',
      url: '/users/search',
      data: {
        query: queryVal
      },
      dataType: 'json',
      success: success,
      error: () => console.log('fail')
    });

  }
};

module.exports = APIUtil;


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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


/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js");

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


/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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


/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map