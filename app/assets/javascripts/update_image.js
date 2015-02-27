function onLinkedInLoad() {
  IN.Event.on(IN, "auth", onLinkedInAuth);
}

function onLinkedInAuth() {
  IN.API.Profile('me').fields(['pictureUrl']).result(function(result) {
    updateImage(result.values[0]);
  });
}

function updateImage(img) {
  $('#user_image_url').val(img['pictureUrl']);
}
