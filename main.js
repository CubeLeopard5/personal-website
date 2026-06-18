// Shared site behaviour: smooth scrolling, mobile menu, scroll-spy.
// Loaded on every page so the mobile navigation works consistently.

document.addEventListener('DOMContentLoaded', () => {
    // Smooth scrolling for in-page anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    // Mobile hamburger menu
    const hamburger = document.getElementById('hamburger');
    const navMenu = document.getElementById('nav-menu');

    if (hamburger && navMenu) {
        const closeMenu = () => {
            hamburger.classList.remove('active');
            navMenu.classList.remove('active');
            hamburger.setAttribute('aria-expanded', 'false');
        };

        hamburger.addEventListener('click', (e) => {
            e.stopPropagation();
            const isOpen = navMenu.classList.toggle('active');
            hamburger.classList.toggle('active', isOpen);
            hamburger.setAttribute('aria-expanded', String(isOpen));
        });

        // Close the menu when a link is tapped
        navMenu.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', closeMenu);
        });

        // Close the menu when tapping outside of it
        document.addEventListener('click', (e) => {
            if (!hamburger.contains(e.target) && !navMenu.contains(e.target)) {
                closeMenu();
            }
        });
    }

    // Scroll-spy: highlight the nav link for the section currently in view.
    // Only relevant on pages with in-page section navigation (e.g. index.html).
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-menu a[href^="#"]');

    if (sections.length && navLinks.length) {
        window.addEventListener('scroll', () => {
            let current = '';
            sections.forEach(section => {
                if (window.scrollY >= section.offsetTop - 200) {
                    current = section.getAttribute('id');
                }
            });
            navLinks.forEach(link => {
                link.classList.toggle('active', link.getAttribute('href') === `#${current}`);
            });
        });
    }
});
