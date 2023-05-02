<!DOCTYPE html>
<html>

<head>
    <title>
        <?php echo $title; ?>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./style.css">

</head>

<body>


    <!-- Navbar Start -->

    <div class="container-fluid top-nav bg-dark">
        <div class="row">
            <div class="col-12">
                <div>
                    <p class="top-nav-txt btnAccessibility">Accessibility tools <i class="fa-solid fa-volume"></i></p>
                </div>
            </div>

            <div class="col-md-12 bg-secondary text-center accessibilityBox" style="display: none;">
                <div class="items">
                    <p class="m-0 py-3">
                        <!-- For Text-to-Speech, click the <i class="fa fa-volume-up" aria-hidden="true"></i>
                    icon in the bottom right corder.  -->
                        <button class="btn btn-primary btnReader">Turn On Screen Reader</button>

                    </p>
                    <div class="wrap d-flex align-items-center justify-content-center py-3">
                        Font Options:
                        <div class="btnA" id="btnADefault">A</div>
                        <div class="btnA" id="btnA1">A</div>
                        <div class="btnA" id="btnA2">A</div>
                        <div class="btnA" id="btnA3">A</div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="container-fluid ">
        <div class="row">
            <!-- <div class="col-md-6"></div> -->
            <div class="col-md-12 mid-nav">
                <ul>
                    <li class="w-80">
                        <form class="form-inline pos-rel" method="get" action="./shop.php">
                            <input class="form-control mr-sm-2 search-bar" name="q" type="search" placeholder="Search"
                                aria-label="Search">
                            <button type="submit" class="searchBtn btn btn-primary">Search</button>
                        </form>
                    </li>
                    <li><a class="pos-rel" href="./cart.php">
                            <div class="badge">99</div><i class="fa fa-shopping-cart text-black fs-1"
                                aria-hidden="true"></i>
                        </a></li>

                    <?php

                    if (isset($_SESSION['sid'])) {
                        // this code will check if user is logged in then user's name will be fetched from database, if no user is logged in then sign in option will be shown.
                        include "./connection.php";
                        $sql = "SELECT name FROM customer WHERE custid = '" . $_SESSION['sid'] . "'";
                        $result = mysqli_query($conn, $sql);

                        if (mysqli_num_rows($result) > 0) {
                            // output data of each row
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo '<li>Welcome ' . $row['name'] . '!</li>';
                            }
                        } else {
                            echo "0 results";
                        }

                    } else {
                        echo '<li><a href="./customer.php"><button class="mybtn">Sign In</button></a></li>';
                    }

                    ?>

                    <!-- <li><a href="./register.php"><button class="mybtn">Register</button></a></li> -->


                </ul>
            </div>
        </div>
    </div>



    <nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="logo.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Shop
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./shop.php">All Products</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Furnitures">Furnitures</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Laptop">Laptop</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Watches">Watches</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Glasses">Glasses</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Men">Men</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Women">Women</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=Kitchen">Kitchen Accessories</a></li>
                            <li><a class="dropdown-item" href="./shop.php?cat=AutoParts">Auto Parts</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./shop.php?cat=Men">Men</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./shop.php?cat=Women">Women</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="customer.php">Payment</a>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="about.php">About</a>
                    </li>
                    <?php
                    if (isset($_SESSION['sid'])) {
                        echo '<li class="nav-item">
                        <a class="nav-link" href="./data_operation.php?action=logout">Logout</a>
                    </li>';
                    } else {
                        echo '<li class="nav-item">
                        <a class="nav-link" href="./register.php">Register</a>
                    </li>';
                    }
                    ?>


                </ul>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->