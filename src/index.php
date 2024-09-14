<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>


<?php

    $servername = "mysql_db";
    $username = "root";
    $password = "root";
    $dbname = "AmazonMusic";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    //Check if post variables are present to send insert into the DB
    if(!empty($_POST['email']) && !empty($_POST['firstname']) && !empty($_POST['lastname']) && !empty($_POST['password'])){
        
        $sqlInsertMember = "INSERT INTO Member (Email, FirstName, SureNames, Password)";
        $sqlInsertMember .= " Values ('".$_POST['email']."','".$_POST['firstname']."','".$_POST['lastname']."','".$_POST['password']."')";

        if ($conn->query($sqlInsertMember) === TRUE) {
            $isInserted = true;
        } else {
            $isInserted = false;
        }
    }

    $sql = "SELECT id, Email, FirstName, SureNames FROM Member";
    $result = $conn->query($sql);

?>

<div class="container">
    <div class="jumbotron jumbotron-fluid">   
        <div class="container">
            <h1 class="display-4">Member</h1>
            <p class="lead">This is a project to create and list members for task 9.2D on Unit SIT103 - Database Fundamentals</p>

            <p class="lead">Enter a New Member</p>

            <form role="form" id="member-form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

            <?php if(!empty($isInserted) && $isInserted) { ?>
            <div class="alert alert-success" role="alert" id="pnl-success">
                Member inserted
            </div>
            <?php } ?>

            <div class="form-group row">
                <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                <input type="email" class="form-control" id="txtEmail" name="email" require placeholder="Enter Email">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputUser" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="txtFirstName" name="firstname" require placeholder="Enter First Name">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputUser" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="txtLastName" name="lastname" require placeholder="Enter Last Name">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                <input type="password" class="form-control" id="txtPassword" name="password" require placeholder="Enter Password">
                </div>
            </div>
            <div class="form-group row d-none" id="pnl-alert">
                <label for="inputUser" class="col-sm-2 col-form-label"></label>
                <div class="col-sm-10">
                    <div class="alert alert-danger" role="alert">
                        
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="offset-sm-2 col-sm-10">
                <input type="submit" value="Go" id="submit" class="d-none">
                <input type="button" value="Create" name="submit" id="btnFakeSubmit" class="btn btn-primary"/>
                </div>
            </div>
            </form>

            <table class="table">
                <thead class="thead-dark">
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Email</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result->num_rows > 0) {
                        // output data of each row
                        
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>";

                            echo '<th scope="row">';
                            echo $row["id"];
                            echo '</th>';

                            echo '<td>';
                            echo $row["Email"];
                            echo '</td>';

                            echo '<td>';
                            echo $row["FirstName"];
                            echo '</td>';

                            echo '<td>';
                            echo $row["SureNames"];
                            echo '</td>';

                            echo "</tr>";
                        }
                      }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

</div>

  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <!-- Custom Script -->
  <script>

    $(document).ready(function(){

        window.setTimeout(function(){
        $('#pnl-success').addClass('d-none');
        }, 5000); //<-- Delay in milliseconds to hide success message

        //Button to make the validation before posting the form
        $("#btnFakeSubmit").on("click", function() {
            $('#pnl-alert').addClass('d-none');

            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            let email = $('#txtEmail').val().trim();
            let firstName = $('#txtFirstName').val().trim();
            let lastName = $('#txtLastName').val().trim();
            let password = $('#txtPassword').val().trim();
            let errorMessage = '';

            if(email == ''){
                errorMessage += 'Enter Email<br>';
            }
            if(email != '' && !emailPattern.test(email)){
                errorMessage += 'Enter a valid Email<br>';
            }

            if(firstName == ''){
                errorMessage += 'Enter First Name<br>';
            }
            if(lastName == ''){
                errorMessage += 'Enter Last Name<br>';
            }
            if(password == ''){
                errorMessage += 'Enter Password<br>';
            }

            if(errorMessage==''){
                $('#submit').trigger('click');
                
            }else{
                $('#pnl-alert').removeClass('d-none');
                $('#pnl-alert>div>div').text('');
                $('#pnl-alert>div>div').append(errorMessage);
            }
        });
    })
    </script>
    <!-- End of Custom Script -->

</body>
</html>