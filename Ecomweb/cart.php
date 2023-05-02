<?php
// If cart page is opened before logging into account then user will be redirected to sign in page.
session_start();
if (!isset($_SESSION['sid'])) {
    header("Location: ./customer.php?to=cart");
}
$title = "Cart";

include "./includes/header.php";
?>

<main class="container">

    <h1 class="heading">
        <ion-icon name="cart-outline"></ion-icon> Shopping Cart
    </h1>

    <div class="item-flex">

        <!--
   - checkout section
  -->
        <section class="checkout">

            <h2 class="section-heading">Payment Details</h2>

            <div class="payment-form">

                <div class="payment-method">

                    <button class="method selected">
                        <ion-icon name="card"></ion-icon>

                        <span>Credit Card</span>

                        <ion-icon class="checkmark fill" name="checkmark-circle"></ion-icon>
                    </button>

                </div>

                <form action="#" method="post" id="formPay">

                    <div class="cardholder-name">
                        <label for="cardholder-name" class="label-default">Cardholder name</label>
                        <input type="text" name="cardholder-name" id="cardholder-name" class="input-default" required>
                    </div>

                    <div class="card-number">
                        <label for="card-number" class="label-default">Card number</label>
                        <input type="number" name="card-number" id="card-number" class="input-default" required>
                    </div>

                    <div class="input-flex">

                        <div class="expire-date">
                            <label for="expire-date" class="label-default">Expiration date</label>

                            <div class="input-flex">

                                <input type="number" name="day" id="expire-month" placeholder="12" min="1" max="12"
                                    class="input-default" required>
                                /
                                <input type="number" name="month" id="expire-year" placeholder="23" min="01" max="99"
                                    class="input-default" required>

                            </div>
                        </div>

                        <div class="cvv">
                            <label for="cvv" class="label-default">CVV</label>
                            <input type="number" name="cvv" id="cvv" min="111" max="999" class="input-default" required>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary mt-4 btnPay">
                        <b>Pay</b>
                    </button>
                </form>

            </div>



        </section>


        <!--
    - cart section
  -->
        <section class="cart">

            <div class="cart-item-box">

                <h2 class="section-heading oHead">Order Summery</h2>

                <!-- <div class="products-cart-list"> -->
                <!-- <div class="product-card">
                        <div class="card">
                            <div class="img-box">
                                <img src="./images/green-tomatoes.jpg" alt="Green tomatoes" width="80px"
                                    class="product-img">
                            </div>
                            <div class="detail">
                                <h4 class="product-name">Green Tomatoes 1 Kilo</h4>
                                <div class="wrapper">
                                    <div class="product-qty">
                                        <button id="decrement">
                                            <ion-icon name="remove-outline"></ion-icon>
                                        </button>
                                        <span id="quantity">1</span>
                                        <button id="increment">
                                            <ion-icon name="add-outline"></ion-icon>
                                        </button>
                                    </div>
                                    <div class="price">
                                        $ <span id="price">1.25</span>
                                    </div>
                                </div>
                            </div>
                            <button class="product-close-btn">
                                <ion-icon name="close-outline"></ion-icon>
                            </button>
                        </div>
                    </div>

                    <div class="product-card">
                    </div> -->



                <!-- </div> -->

            </div>

            <div class="wrapper">

                <div class="amount">

                    <div class="subtotal">
                        <span>Subtotal</span> <span>$ <span id="subtotal">0.00</span></span>
                    </div>

                    <div class="tax">
                        <span>Tax</span> <span>$ <span id="tax">0.10</span></span>
                    </div>

                    <div class="shipping">
                        <span>Shipping</span> <span>$ <span id="shipping">0.00</span></span>
                    </div>

                    <div class="total">
                        <span>Total</span> <span>$ <span id="total">0.00</span></span>
                    </div>

                </div>

            </div>

        </section>

    </div>

</main>
<?php include "./includes/footer.php"; ?>