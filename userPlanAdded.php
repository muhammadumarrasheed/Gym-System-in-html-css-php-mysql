<?php
include "dbconn.php";
if(isset($_POST['submit'])){
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
  $username = validate($_POST['username']);
  $plan = validate($_POST['status']);
  $sql = "SELECT userEmail from user where name = '$username'";
  $result = mysqli_query($con,$sql);
  $row = mysqli_fetch_assoc($result);
  $userEmail = $row['userEmail'];
  if(empty($plan)){
    header("Location: userPlanAdded.php?error = Status is required");
    exit();
  }else{
     $sql = "insert into plan(userEmail,planname)
           values('$userEmail','$plan')";
       $result = mysqli_query($con, $sql);
  if($result){
    header("Location: usersPlans.php");
  }else{
    header("Location: usersPlans.php?error = Sorry,Users fitness already stored");
  }
}
}
?>

<?php
session_start();
$var = $_SESSION['email'];
$query = "SELECT * from user where user.trainerEmail = '$var'";
$result2 = mysqli_query($con, $query);
$options = "";
while($row2 = mysqli_fetch_array($result2))
{
    $options = $options."<option>$row2[1]</option>";
}
?>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Admin Panel</title>
</head>
<style>
* {
    box-sizing: border-box;
}

body {
    padding: 0;
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

body:before {
    content: '';
    position: fixed;
    width: 100vw;
    height: 100vh;
    background: black;
    background-position: center center;
    background-image: url(pic.jpg);
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    opacity: 0.9;
    -webkit-filter: blur(5px);
    -moz-filter: blur(1px);
}

.contact-form {
    display: inline-block;
    position: absolute;
    top: 10px;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 1520px;
    height: 45px;
    padding: 80px 40px;
    background: transparent;
}

.contact-form h2 {
    position: absolute;
    font-family: 'poppins', 'san-serif';
    margin: 0;
    padding: 0 0 20px;
    top: 91px;
    font-weight: bolder;
    font-size: 40px;
    left: -28px;
    color: #fff;
}

label {
    font-family: 'poppins', 'san-serif';
    margin: 0;
    padding: 0 0 20px;
    color: white;
    position: relative;
}

.contact-form li {
    font-family: 'poppins', 'san-serif';
    position: relative;
    font-size: large;
    top: 25px;
    left: 1000px;
    display: inline-block;
    margin: 0 15px;
}

.contact-form li a {
    text-decoration: none;
    color: #fff;
    padding: 5px 0;
    position: relative;
}

.contact-form li a::after {
    content: '';
    background: #ff3d00;
    width: 0;
    height: 2px;
    position: absolute;
    left: 0;
    transition: width 0.5s;
}

.contact-form li a:hover::after {
    width: 100%;
}


.contact-form .login {
    top: 100px;
    position: absolute;
    width: 90px;
    left: 1450px;
    height: 36px;
    font-size: 18px;
    font-weight: bold;
    padding: 10px;
    border: none;
    background: red;
    color: #fff;
    cursor: pointer;
    border-radius: 3px;
}

.container {
    position: absolute;
    top: 780px;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 700px;
    height: 1400px;
    padding: 80px 40px;
}

.container .insertbtn {
    top: 350px;
    cursor: pointer;
    position: absolute;
    width: 130px;
    left: 45px;
    height: 50px;
    font-weight: bolder;
    font-size: large;
    background: #365299;
    padding: 10px 15px;
    color: #f5ecec;
    border-radius: 5px;
    margin-right: 10px;
    box-shadow: 0 12px 16px 0 rgba(10, 10, 95, 0.24), 0 17px 50px 0 rgba(73, 75, 199, 0.19);
    border: none;
}

.container input {
    border-radius: 6px;
    height: 60px;
    opacity: 0.7;
    background: black;
    border: rgb(5, 4, 4);
}

.container ::placeholder {
    color: white;
    font-size: 15px;
}

.container .title {
    position: absolute;
    font-size: 25px;
    color: red;
    font-weight: bolder;
    left: 220px;
    top: 30px;
}

.container label {
    color: rgb(255, 255, 255);
    font-size: 18px;
    padding: 10px;
}
</style>

<body>
    <div class="contact-form">
        <button class="login" name="submit"><a href="home.php">Log out</button>
        <li class="A"><a href="trainerPanel.php">Home</a></li>
        <h2><i class="fa-solid fa-dumbbell" style="font-size:30px;color:red;"></i> Gym Fitness</h2>
        <li><a href="usersfitness.php">Users' Fitness</a></li>
        <li><a class="active" href="usersPlans.php">Users' Plans</a></li>
    </div>
    <div class="container my-5">
        <!-- <img alt="" class="avatar" src="https://st2.depositphotos.com/1557108/7754/v/600/depositphotos_77546730-stock-illustration-vector-illustration-fitness-gym-logo.jpg"> -->
        <form method="post">
            <div class="form-group">
                <label class="title">Add plan Form</label>
            </div>
            <div class="from-group mb-3">
                <label class="form-group">Users</label>
                <select name="username" class="form-control">
                    <?php echo $options;?>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">Status</label>
                <input type="text" class="form-control" placeholder="Enter fitness status" name="status"
                    autocomplete="off">
            </div>
            <button name="submit" class="insertbtn">Submit</button>
        </form>

    </div>
</body>

</html>