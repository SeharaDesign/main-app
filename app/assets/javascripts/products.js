$(document).ready(function() {
    $('.tab:first').fadeIn(); //fade in first tab on load
    $(".tab").not(":first").hide();   //hiding tab content except first one 
    $("ul.tabs li").click(function() { //on tab click ($this)
        $("ul.tabs li.active").removeClass("active"); // remove class .active
        $(this).addClass("active"); // set $this to class .active
        $(".tab").hide(); // hide content from all tabs      
        $($('a',this).attr("href")).fadeIn('slow');  // match the content id (e.g., #tab1 with the value of $this's href attribute)
        return false; //event.preventDefault(); event.stopPropagation();
    });               //stops callback execution and returns immediately when called.
});