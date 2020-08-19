import Typed from 'typed.js'

const loadDynamicBannerText = () => {
    if (document.getElementById("banner-typed-text")) {
        new Typed('#banner-typed-text', {
            strings: ["Take part in the future of mobility", "And save our only planet"],
            typeSpeed: 100,
            loop: true
        });
    }
}

export { loadDynamicBannerText };