
const searchResult = (query) => {
  const results = document.getElementById("results");
  fetch(`https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${query}`)
    .then(response => response.json())
    .then((data) => {
      data.drinks.forEach((drink) => {
        const suggestion = `<li class="list-group-item">${drink["strDrink"]}</li>`;
        results.insertAdjacentHTML('beforeend', suggestion);
      });
    });
};
const searchValue = () => {
  const search = document.getElementById("search");
  search.addEventListener('keyup', (event) => {
    event.preventDefault();
    results.innerHTML = '';
    searchResult(search.value);
    console.log(event);
  });
};

export {searchResult};
export {searchValue};