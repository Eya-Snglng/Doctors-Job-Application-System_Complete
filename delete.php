<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Applicants</title>
    <link rel="stylesheet" href="styles.css">
</head>

<?php
session_start();
require_once 'core/dbConfig.php';
require_once 'core/models.php';

// Ensure that the user is logged in (optional based on your session handling)
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Check if an ID is provided in the URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // If the user has confirmed the deletion
    if (isset($_GET['confirm']) && $_GET['confirm'] == 'yes') {

        // First, delete related activity logs if needed
        $deleteLogsQuery = "DELETE FROM activity_logs WHERE log_id = :id";
        $deleteLogsStmt = $pdo->prepare($deleteLogsQuery);
        $deleteLogsStmt->bindParam(':id', $id);
        $deleteLogsStmt->execute();

        // Now delete the applicant
        $deleteApplicantQuery = "DELETE FROM job_applicants WHERE id = :id";
        $deleteApplicantStmt = $pdo->prepare($deleteApplicantQuery);
        $deleteApplicantStmt->bindParam(':id', $id);

        if ($deleteApplicantStmt->execute()) {
            // Log the activity of the deletion
            logActivity($_SESSION['user_id'], $_SESSION['username'], 'delete', 'Deleted applicant with ID: ' . $id);

            // Set a success message
            $_SESSION['message'] = "Applicant deleted successfully.";

            // Redirect to the main page
            header('Location: index.php');
            exit();
        } else {
            // Set an error message
            $_SESSION['message'] = "Error deleting applicant.";
            header('Location: index.php');
            exit();
        }
    }

    // Display the confirmation prompt
    echo '<h1>Are you sure you want to delete this applicant?</h1>';
    echo '<a href="index.php">Back</a> | <a href="delete.php?id=' . $id . '&confirm=yes">Confirm</a>';
    exit();
} else {
    // If no ID is passed, show an error
    echo '<h1>No applicant ID provided.</h1>';
    echo '<a href="index.php">Back to Applicants</a>';
    exit();
}
?>

</html>