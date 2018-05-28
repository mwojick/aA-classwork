const GifApiUtil = {
  newGifAJAX: function() {
    // always explicitly return because it makes debugging easier
    // explicitly returning whatever is returned by the ajax method. (a promise)
    return $.ajax({
      method: 'GET',
      url: `https://api.giphy.com/v1/gifs/random?api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
      // success: function() {
      //   console.log("success!");
      // },
      // error: function() {
      //   console.log("error!!!");
      // }
    });
  },
  saveGifAJAX: function(gifArg) {
    return $.ajax({
      method: "POST",
      url: "/gifs",
      data: {
        gif: gifArg
      }
    });
  },
  fetchSavedGifAJAX: function(titleArg) {
    return $.ajax({
      method: 'GET',
      url: `/gifs/${titleArg}`
    });
  }
};

module.exports = GifApiUtil;