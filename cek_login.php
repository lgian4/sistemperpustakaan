
<?php
 session_start();
// Process delete operation after confirmation
if(isset($_POST["username"]) && !empty($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["password"])){
    // Include config file
    require_once "config.php";
    
    // Prepare a delete statement
    $sql = "select id,nama,alamat,username from petugas where username = ? and password = ?";
    
    if($stmt = mysqli_prepare($link, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "ss", $param_user,$param_pass);
        
        // Set parameters
        $param_user = trim($_POST["username"]);
        $param_pass = $_POST["password"];

        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            $result = mysqli_stmt_get_result($stmt);
    
            if(mysqli_num_rows($result) == 1){
                /* Fetch result row as an associative array. Since the result set contains only one row, we don't need to use while loop */
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                
                // Retrieve individual field value
                $_SESSION["id"] = $row["id"];
                $_SESSION["nama"] = $row["nama"];
                $_SESSION["alamat"] = $row["alamat"];
                $_SESSION["errorstr"] = "";
                header("location:index.php");
                exit();
            } else{
                $_SESSION["errorstr"] = "User tidak ditemukan";
                // URL doesn't contain valid id parameter. Redirect to error page
                header("location:login.php");
                exit();
            }
            
        } else{
            echo "Oops! Something went wrong. Please try again later.";
        }
    }
     
    // Close statement
    mysqli_stmt_close($stmt);
    
    // Close connection
    mysqli_close($link);
} else{
    // Check existence of id parameter
    if(empty(trim($_GET["id"]))){
        // URL doesn't contain id parameter. Redirect to error page
        header("location: error.php");
        exit();
    }
}
?>