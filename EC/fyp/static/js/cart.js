'use strict';

// all initial elements


const tax = 0.05;
let subtotal = 0;
let totalTax = 0;
let total = 0;
// Function to get Item Details from Database on page load. If first time opened with an empty cart then initialize cart with empty list of items.
function getCartDetails() {
    let out = "";
    let cart = JSON.parse(localStorage.getItem('cart'));
    // Initialize Cart if not initialized before, if already initialized then get from localstorage.
    cart == null ? (cart = {
        "total": 0,
        "items": []
    }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));
    console.log(cart.items.length > 0)
    if (cart.items.length > 0) {

        for (let index = 0; index < cart.items.length; index++) {
            let item = cart.items[index];
            $.ajax({
                type: 'GET',
                url: '/ajax_single_prod',
                data: {
                    'id': item.id
                },
                success: function (response) {
                    console.log(response);
                    var product = response.product;
                    subtotal += parseFloat(product.price)
                    out += `<div class="product-card">
                    <div class="cardd">
                        <div class="img-box">
                            <img src="/static/images/images/${product.image}" alt="Green tomatoes" width="80px"
                                class="product-img" height="80">
                        </div>
                        <div class="detail">
                            <h4 class="product-name">${product.name}</h4>
                            <div class="wrapper">
                                <div class="product-qty">
                                    <button class="decrement">
                                        <ion-icon name="remove-outline"></ion-icon>
                                    </button>
                                    <span class="quantity">1</span>
                                    <button class="increment">
                                        <ion-icon name="add-outline"></ion-icon>
                                    </button>
                                </div>
                                <div class="price">
                                    $ <span class="price">${product.price}</span>
                                </div>
                            </div>
                        </div>
                        <button class="product-close-btn">
                            <ion-icon name="close-outline"></ion-icon>
                        </button>
                    </div>
                </div>`;
                    $(".cart-item-box").append(out);
                    out = "";
                    // calcualting the `total`
                    let subtotall = parseFloat($("#subtotal").html()) + parseFloat(product.price);
                    $("#subtotal").html(subtotall.toFixed(2));
                    let totall = subtotall + 0.1;
                    $("#total").html(totall.toFixed(2));
                    
                    // $("#total").html(total.toFixed(2));
                }
            });

        }
        
        // $(".products-cart-list").html(out);
    }
    else {
        $(".oHead").html("Please Add Products to your cart")
    }
}

$(document).ready(function () {
    getCartDetails();
    // Check if all fields are filled then submit form and show Completed Order Message to User.
    $("#formPay").submit(function (e) {
        e.preventDefault();
        let card = $("#card-number").val();
        if(card.length < 16)
        {
            alert("Please Provide a valid card number");
        }
        else
        {
            alert("Order Completed");
        }
        
    });
    

    
})