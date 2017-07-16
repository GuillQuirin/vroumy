// Agency Theme JavaScript

(function($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function(){ 
            $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })

})(jQuery); // End of use strict

$(document).ready(function() {
    $('#users_table').dataTable( {
        "language": {
            "lengthMenu": "Affichage de _MENU_ enregistrements par page",
            "zeroRecords": "Aucun résultat",
            "info": "Affichage de la page _PAGE_ sur _PAGES_",
            "infoEmpty": "Pas de résulat pour la recherche",
            "infoFiltered": "(filtré sur _MAX_ résultats totaux)",
            "search" : "Recherche : ",
            "paginate": {
                "previous": "Précédent",
                "next": "Suivant"
            }
        }
    } );
    $('#startDate').datepicker();
});
