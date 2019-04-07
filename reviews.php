<?php
/* reviews.php
    DESCRIPTION: REST service for interacting with datamodel review calls
    @author : drews
    @version : 0.6
*/

//DEPENDENCIES
include 'restUtilities.php';
include 'datamodel.php';

//--==MAIN OPERATION==--\\  

//RETRIEVE REQUEST INFORMATION
$method = $_SERVER['REQUEST_METHOD'];
$path = explode("/", $_SERVER['PATH_INFO']);
$pathLength = count($path);
$version = $path[1];
$call = $path[2];

//DETERMINE CALL
$isGet = ($method === "GET");
$isPost = ($method === "POST");
$correctVersion = ($version == "v2");
$noParam = $pathLength == 3;
$containsParam = $pathLength == 4;

$reviewsForId = ($isGet && $correctVersion && $containsParam && $call == "id");
$addReview = ($isPost && $correctVersion && $noParam && $call == "add");

//PROCESS REQUEST
if($reviewsForId) {
    $id = $path[3];
    $output = findReviewsById($id);
} elseif($addReview) {
    $body = &$_POST;
    //$body = (array) getJson();
    $output = insertReview($body);
} else {
    $output = invalidCall();
}

//SEND RESPONSE
header("content-type: application/json");
print json_encode($output);