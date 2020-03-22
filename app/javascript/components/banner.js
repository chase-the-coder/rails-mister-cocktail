import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pick your poison"],
    typeSpeed: 100,
    loop: false
  });
}

export { loadDynamicBannerText };
