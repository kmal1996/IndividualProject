<?php
session_start();
require("./connection.php");
// This page will handle all Ajax Requests sent by JQuery/JavaScript, or data submitted via forms.
if (isset($_POST['action'])) {
    $action = $_POST['action'];
    if ($action == "register") {
        $sid = $_POST['ID'];
        $mypass = $_POST['pass'];
        $name= $_POST['name'];
        $sql1 = "INSERT INTO customer (custid,pass,name) VALUES ('$sid','$mypass', '$name')";
        if (mysqli_query($conn, $sql1)) {
            $_SESSION["success"] = "Registration successfull";
            header("Location: index.php");
        } else {

            $_SESSION["error"] = "Registration failed";
            header("Location: register.php");
        }
    } elseif ($action == "login") {
        $id = $_POST['ID'];
        $pass = $_POST['pass'];
        $url = $_POST['url'];
        unset($_SESSION['url']);
        $query = "SELECT * FROM customer WHERE custid='$id'  and pass='$pass'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) == 1) {
            $_SESSION['sid'] = $id;

            // header('location:studentpanel.php');
            // echo '<script>alert("Succeeded")</script>';
            header("location: $url");
        } else {
            $_SESSION['url'] = $url;
            $_SESSION['error'] = "Wrong Credentials";
            header("Location: customer.php");
            // echo '<script>alert("Incorrect Credentials")</script>';
        }
    } elseif ($action == "get-products") {
        // This code will send all products' details stored in database.
        $query = "SELECT * FROM products";
        $result = mysqli_query($conn, $query);
        $prods = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                array_push($prods, $row);
            }
            echo json_encode($prods);
        } else {
            $prods["error"] = "No Product Found";
            echo json_encode($prods);
            // echo '<script>alert("Incorrect Credentials")</script>';
        }
    }
    elseif ($action == "get-products-cat") {
        // This code will filter products based on their categories.
        $cat = $_POST['cat'];
        $query = "SELECT * FROM products where category = '$cat'";
        $result = mysqli_query($conn, $query);
        $prods = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                array_push($prods, $row);
            }
            echo json_encode($prods);
        } else {
            $prods["error"] = "No Product Found";
            echo json_encode($prods);
            // echo '<script>alert("Incorrect Credentials")</script>';
        }
    }
    elseif ($action == "get-products-search") {
        // When User search any products, then search form data will be submitted here and products will be filtered based on query submitted by user.
        $q = $_POST['q'];
        $query = "SELECT * FROM products where name like '%$q%'";
        $result = mysqli_query($conn, $query);
        $prods = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                array_push($prods, $row);
            }
            echo json_encode($prods);
        } else {
            $prods["error"] = "No Product Found";
            echo json_encode($prods);
            // echo '<script>alert("Incorrect Credentials")</script>';
        }
    }
    elseif ($action == "get-product") {
        // This will be hit by Javascript on Cart Page to get Individual Product Details based on their IDs in cart.
        $id = $_POST['id'];
        $query = "SELECT * FROM products where id = $id";
        $result = mysqli_query($conn, $query);
        $prods = array();
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                array_push($prods, $row);
            }
            echo json_encode($prods);
        } else {
            $prods["error"] = "No Product Found";
            echo json_encode($prods);
            // echo '<script>alert("Incorrect Credentials")</script>';
        }
    }
}

if(isset($_GET['action']))
{
    $action = $_GET['action'];
    // This code will sign out user from system by unsetting SESSION variable.
    if($action == "logout")
    {
        unset($_SESSION['sid']);
        header("Location: ./index.php");
    }
}

mysqli_close($conn);
?>