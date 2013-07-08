$(document).ready(function() {
  $('.twitter_username').on('submit', function(e) {
    e.preventDefault();
    var usernameValue = $('.entered_username').val();
    window.location.replace("/" + usernameValue);
  });
});
