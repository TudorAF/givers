// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
    $(".accordion-button").click(function() {
        // Toggle accordion content visibility
        var content = $(this).next(".accordion-content");
        content.slideToggle();

        // Toggle the accordion icon (+/-)
        var icon = $(this).find(".accordion-icon");
        if (content.is(':visible')) {
            icon.text('-');
        } else {
            icon.text('+');
        }
    });
});

