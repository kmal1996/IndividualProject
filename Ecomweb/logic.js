// This function will add and remove product from cart.
function checkCart(id) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    cart == null ? (cart = {
        "total": 0,
        "items": []
    }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));

    let isFound = false;
    for (let index = 0; index < cart.items.length; index++) {
        let item = cart.items[index];
        if (item.id == id) {
            isFound = true;

        }
    }
    isFound == false ? (item = { id: id }, cart.items.push(item), localStorage.setItem("cart", JSON.stringify(cart)), $(".prod" + id).html("Remove From Cart")) : (cart.items.splice(cart.items.findIndex(v => v.id === id), 1), localStorage.setItem("cart", JSON.stringify(cart)), $(".prod" + id).html("Add To Cart"));
    cart.items.length > 0 ? ($(".badge").html(cart.items.length), $(".badge").removeClass("d-none")) : $(".badge").addClass("d-none")
    console.log(cart);
}

$(document).ready(function () {
    // The following code will check if user has visited shop page via search query or category and send ajax request to data_operation.php on that basis.
    let searchParams = new URLSearchParams(window.location.search);
    let searchParamName = 'cat';
    let searchParamQ = 'q';
    let name = searchParams.get(searchParamName);
    let q = searchParams.get(searchParamQ);
    console.log(name);
    if (name != null) {
        $.ajax({
            type: 'POST',
            url: 'data_operation.php',
            data: {
                'action': 'get-products-cat',
                'cat': name
            },
            success: function (response) {
                let cart = JSON.parse(localStorage.getItem('cart'));
                cart == null ? (cart = {
                    "total": 0,
                    "items": []
                }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));

                let cartItems = [];
                for (let index = 0; index < cart.items.length; index++) {
                    let item = cart.items[index];
                    cartItems.push(item.id);
                }

                var str = JSON.parse(response);
                let out = "";
                for (let i = 0; i < str.length; i++) {
                    const element = str[i];
                    out += `<div class="product product${element.id}">
                <div class="image">
                    <img src="./images/${element.image}" alt="">
                </div>
                <div class="namePrice">
                    <h1>${element.name}</h1>
                    <span>$ ${element.price}</span>
                </div>`;
                    let desc = element.description.substr(0, 50) + "...";
                    out += `
                <p>${desc}</p>
                <div class="Add">`;
                    if (cartItems.includes(parseInt(element.id)) == true) {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Remove from Cart</button>`;
                    }
                    else {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Add to Cart</button>`;
                    }

                    out += `</div></div>`;
                }
                $(".products").html(out);
                // $("#tagsList").html(str)
                // tableTag = $('.dashboard-request-table').DataTable();
            }
        });
        
    }
    else if (q != null) {
        $(".search-bar").val(q);
        $.ajax({
            type: 'POST',
            url: 'data_operation.php',
            data: {
                'action': 'get-products-search',
                'q': q
            },
            success: function (response) {
                let cart = JSON.parse(localStorage.getItem('cart'));
                cart == null ? (cart = {
                    "total": 0,
                    "items": []
                }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));

                let cartItems = [];
                for (let index = 0; index < cart.items.length; index++) {
                    let item = cart.items[index];
                    cartItems.push(item.id);
                }

                var str = JSON.parse(response);
                let out = "";
                for (let i = 0; i < str.length; i++) {
                    const element = str[i];
                    out += `<div class="product product${element.id}">
                    <div class="image">
                        <img src="./images/${element.image}" alt="">
                    </div>
                    <div class="namePrice">
                        <h1>${element.name}</h1>
                        <span>$ ${element.price}</span>
                    </div>`;
                    let desc = element.description.substr(0, 50) + "...";
                    out += `
                    <p>${desc}</p>
                    <div class="Add">`;
                    if (cartItems.includes(parseInt(element.id)) == true) {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Remove from Cart</button>`;
                    }
                    else {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Add to Cart</button>`;
                    }

                    out += `</div></div>`;
                }
                $(".products").html(out);
                // $("#tagsList").html(str)
                // tableTag = $('.dashboard-request-table').DataTable();
            }
        });
    }

    else {
        $.ajax({
            type: 'POST',
            url: 'data_operation.php',
            data: {
                'action': 'get-products',
            },
            success: function (response) {
                let cart = JSON.parse(localStorage.getItem('cart'));
                cart == null ? (cart = {
                    "total": 0,
                    "items": []
                }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));

                let cartItems = [];
                for (let index = 0; index < cart.items.length; index++) {
                    let item = cart.items[index];
                    cartItems.push(item.id);
                }

                var str = JSON.parse(response);
                let out = "";
                for (let i = 0; i < str.length; i++) {
                    const element = str[i];
                    out += `<div class="product product${element.id}">
                    <div class="image">
                        <img src="./images/${element.image}" alt="">
                    </div>
                    <div class="namePrice">
                        <h1>${element.name}</h1>
                        <span>$ ${element.price}</span>
                    </div>`;
                    let desc = element.description.substr(0, 50) + "...";
                    out += `
                    <p>${desc}</p>
                    <div class="Add">`;
                    if (cartItems.includes(parseInt(element.id)) == true) {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Remove from Cart</button>`;
                    }
                    else {
                        out += `<button class="prod${element.id}" onclick="checkCart(${element.id})">Add to Cart</button>`;
                    }

                    out += `</div></div>`;
                }
                $(".products").html(out);
                // $("#tagsList").html(str)
                // tableTag = $('.dashboard-request-table').DataTable();
            }
        });
    }

});
