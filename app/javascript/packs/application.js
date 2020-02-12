/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// import "bootstrap";
// import "jquery/dist/jquery.js";
// import "popper.js/dist/popper.js";
import "@fortawesome/fontawesome-free/js/all";
import "bootstrap/dist/js/bootstrap";
import "../src/application.scss";
const images = require.context("../images/", true);
import "../javascripts/game_room.js";
import "../javascripts/user.js";
