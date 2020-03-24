  <div class="form-group">
    <input type="text" class="form-control w-50 m-auto" id="search" placeholder="margarita">
    <button type="submit" class="btn btn-primary mt-4">Submit</button>
    <%= link_to 'Create cocktail', new_cocktail_path, class: "btn btn-success mt-4 white" %>
    <% cocktail = @cocktails[rand(1..239)] %>
    <%= link_to "Random Cocktail" , cocktail_path(cocktail), class: "btn btn-danger mt-4" %>
  </div>
