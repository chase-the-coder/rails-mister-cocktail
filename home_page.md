  <div class="form-group">
    <input type="text" class="form-control w-50 m-auto" id="search" placeholder="margarita">
    <button type="submit" class="btn btn-primary mt-4">Submit</button>
    <%= link_to 'Create cocktail', new_cocktail_path, class: "btn btn-success mt-4 white" %>
    <% cocktail = @cocktails[rand(1..239)] %>
    <%= link_to "Random Cocktail" , cocktail_path(cocktail), class: "btn btn-danger mt-4" %>
  </div>









<div class="background">
  <div class="home-container text-center">
    <h1>
      <span id="banner-typed-text" class="western"></span>
    </h1>
    <div class="d-flex justify-content-around">
      <% 3.times do %>
        <% cocktail = @cocktails[rand(1..200)] %>
        <div class="card rounded mb-4" style="width: 18rem;">
          <%= image_tag cocktail.thumbnail, alt: "alttext", class: "card-img-top rounded" %>
          <div class="card-body">
            <h5 class="card-title"><%= cocktail.name %></h5>
            <%= link_to "details" , cocktail_path(cocktail), class: "btn btn-primary" %>
          </div>
        </div>
      <% end %>
    </div>
  <form>
  <div class="form-group">
    <input type="text" class="form-control w-50 m-auto" id="search" placeholder="margarita">
    <button type="submit" class="btn btn-primary mt-4">Submit</button>
    <%= link_to 'Create cocktail', new_cocktail_path, class: "btn btn-success mt-4 white" %>
    <% cocktail = @cocktails[rand(1..239)] %>
    <%= link_to "Random Cocktail" , cocktail_path(cocktail), class: "btn btn-danger mt-4" %>
  </div>
      <ul id="results" class="list-group">
<!--         <%@cocktails.each do |cocktail| %>
        <li><%= link_to cocktail.name , cocktail_path(cocktail)%></li>

        <% end %> -->
    </ul>

  </form>
  </div>
</div>

















const searchResult = (query) => {
  const results = document.getElementById("results");
  fetch(`https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${query}`)
    .then(response => response.json())
    .then((data) => {
      data.drinks.forEach((drink) => {
        const suggestion = `<li class="list-group-item" id="drink">${drink["strDrink"]}</li>`;
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

// const searchResult = (query) => {
//   const results = document.getElementById("results");
//   fetch(`https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${query}`)
//     .then(response => response.json())
//     .then((data) => {
//       data.drinks.forEach((drink) => {
//         const suggestion = `${drink["strDrink"]}`;
//         results.insertAdjacentHTML('beforeend', suggestion);
//       });
//     });
// };
// const searchValue = () => {
//   const search = document.getElementById("search");
//   search.addEventListener('keyup', (event) => {
//     event.preventDefault();
//     // results.innerHTML = '';
//     // searchResult(search.value);
//     console.log(search.value);
//   });
// };

// const drinkChoice = () => {
//   const drink = document.getElementById("drink")
// }

export {searchResult};
export {searchValue};
