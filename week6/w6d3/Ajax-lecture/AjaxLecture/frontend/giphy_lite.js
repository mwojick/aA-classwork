const GifApiUtil = require('./gif_api_util');

const setEventHandlers = () => {
  $('.clear').on('click', () => {
    // Clear out GIF display
  });

  $('#new-gif-form').on('submit', e => {
    e.preventDefault();
    fetchNewGif();
    // Fetch a new GIF
  });

  $('#save-gif-form').on('submit', e => {
    e.preventDefault();
    e.stopPropagation();
    saveGif();
  });

  $('#old-gif-form').on('submit', e => {
    e.preventDefault();
    // Fetch saved GIF
    fetchSavedGif();

  });
};

$(setEventHandlers);

// setEventHandlers will run after the dom is fully loaded
// it adds all of our event handlers after we're sure the elements are on the page

// ------------- GIF ACTIONS - fetchNew, save, and fetchSaved ---------------

const fetchNewGif = () => {
  GifApiUtil.newGifAJAX()
    .then(res => {
      const url = res.data.image_url;
      appendGif(url);
    });

  // Initiate AJAX call to GIPHY API, take response and put on the DOM
};

const saveGif = e => {
  const $input = $('#save-gif-title');
  const title = $input.val();
  $input.val('');

  const gif = {
    title: title,
    url: $('.gif-display').data('url')
  }
  const messages = $('.messages');

  const success = (explicitResponse) => {
    //appended to response to messages
    messages.text('you did it!');
    setTimeout(() => messages.empty(), 5000);
  };
  
  const failure = (errors) => {
    //appended errors to messages
    messages.text(errors.responseJSON[0]);
    setTimeout(() => messages.empty(), 5000);
  };

  GifApiUtil.saveGifAJAX(gif)
    .then(success, failure);

  // Initiate AJAX request to Rails backend, give a message if successful
  // give an error if request was unsuccessful
};

const fetchSavedGif = () => {
  const $input = $('#old-gif-query');
  const title = $input.val();
  $input.val('');

  GifApiUtil.fetchSavedGifAJAX(title)
    .then(
      (response) => {
        appendGif(response.url);
      },
      (errors) => {
        console.log("gif not found!");
      } 
    );


  // Initate AJAX request to Rails backend, add GIF to the DOM if successful
  // show errors if request was unsuccessful
};

const appendGif = newGifURL => {
  // Add gif to the display and keep track of its url
  const $gifDisplay = $('.gif-display');
  $gifDisplay.empty();

  const $newImage = $(`<img class="gif" src="${newGifURL}">`);
  $gifDisplay.data("url", newGifURL);
  $gifDisplay.append($newImage);

  

};