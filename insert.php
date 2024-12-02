<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once 'core/dbConfig.php';
require_once 'core/models.php';

// Handle the form submission for inserting a new applicant
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect the form data
    $data = [
        'first_name' => $_POST['first_name'],
        'last_name' => $_POST['last_name'],
        'email' => $_POST['email'],
        'specialization' => $_POST['specialization'],
        'experience' => $_POST['experience'],
        'hospital' => $_POST['hospital'],
        'phone_number' => $_POST['phone_number']
    ];

    // Check if all fields are filled out
    foreach ($data as $key => $value) {
        if (empty($value)) {
            $error_message = "Please fill out all fields.";
            break;
        }
    }

    if (!isset($error_message)) {
        // Insert the new applicant using the insertApplicant function
        $insertResult = insertApplicant($pdo, $data);

        // Check if the insertion was successful
        if ($insertResult['statusCode'] == 200) {
            // Log the activity
            if (isset($_SESSION['user_id'], $_SESSION['username'])) {
                $user_id = $_SESSION['user_id'];
                $username = $_SESSION['username'];
                $action = "Insert Applicant";
                $action_details = "Inserted a new applicant: " . json_encode($data);

                logActivity($user_id, $username, $action, $action_details);
            }

            // Set a session message and redirect
            $_SESSION['message'] = $insertResult['message'];
            header("Location: index.php"); // Redirect to index.php after successful insertion
            exit();
        } else {
            $_SESSION['message'] = $insertResult['message'];
            $_SESSION['status'] = $insertResult['statusCode'];
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert New Applicant</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="container">
        <header>Insert New Applicant</header>

        <?php if (isset($error_message)) : ?>
            <p class="error"><?= $error_message; ?></p>
        <?php endif; ?>

        <form action="insert.php" method="POST">
            <label for="first_name">First Name:</label>
            <input type="text" name="first_name" value="<?= isset($data['first_name']) ? $data['first_name'] : ''; ?>" required><br>

            <label for="last_name">Last Name:</label>
            <input type="text" name="last_name" value="<?= isset($data['last_name']) ? $data['last_name'] : ''; ?>" required><br>

            <label for="email">Email:</label>
            <input type="email" name="email" value="<?= isset($data['email']) ? $data['email'] : ''; ?>" required><br>

            <label for="specialization">Specialization:</label>
            <input type="text" name="specialization" value="<?= isset($data['specialization']) ? $data['specialization'] : ''; ?>" required><br>

            <label for="experience">Experience:</label>
            <input type="text" name="experience" value="<?= isset($data['experience']) ? $data['experience'] : ''; ?>" required><br>

            <label for="hospital">Hospital:</label>
            <input type="text" name="hospital" value="<?= isset($data['hospital']) ? $data['hospital'] : ''; ?>" required><br>

            <label for="phone_number">Phone Number:</label>
            <input type="text" name="phone_number" value="<?= isset($data['phone_number']) ? $data['phone_number'] : ''; ?>" required><br>

            <input type="submit" name="insertNewApplicantBtn" value="Insert Applicant">
        </form>

        <p><a href="index.php">Back to Applicant List</a></p>
    </div>
</body>

</html>