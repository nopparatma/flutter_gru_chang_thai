function hideUrlBarOnScroll() {
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = window.outerHeight;

    window.addEventListener("scroll", function() {
        var st = window.scrollY;

        if (Math.abs(lastScrollTop - st) <= delta)
            return;

        if (st > lastScrollTop && st > navbarHeight){
            // Scroll down
            window.scrollTo(0, window.scrollY + navbarHeight);
        } else {
            // Scroll up
            window.scrollTo(0, window.scrollY - navbarHeight);
        }

        lastScrollTop = st;
    }, false);
}
