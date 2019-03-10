<?php
/* properties.php
    DESCRIPTION: REST service for interacting with datamodel property calls
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

$allProp = ($isGet && $correctVersion && $noParam && $call == "all");
$addProp = ($isPost && $correctVersion && $noParam && $call == "add");
$byId = ($isGet && $correctVersion && $containsParam && $call == "id");
$byCat = ($isGet && $correctVersion && $containsParam && $call == "by");
$search = ($isGet && $correctVersion && $containsParam && $call == "search");

//PROCESS REQUEST
if($allProp) {
    $output = selectAllProperties();
} elseif($addProp) {
    $body = (array) getJson();
    $output = insertProperty($body);
} elseif($byId) {
    $id = $path[3];
    $output = selectPropertyById($id);
} elseif($byCat) {
    $category = $path[3];
    $output = selectPropertiesByCategory($category);
} elseif($search) {
    $query = $path[3];
    file_put_contents("log2.txt", $query);
    $output = keywordSearch($query);
} else {
    $output = invalidCall();
}

//SEND RESPONSE
header("content-type: application/json");
print json_encode($output);