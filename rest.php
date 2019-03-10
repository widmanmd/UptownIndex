<?php
/* rest.php
    DESCRIPTION: This file contains a REST API for the Uptown-Index project
    @author : drews
    @version 0.4
*/

/* TODO:
    Add remaining calls
	Add datamodel dependency
	Finish handling bad calls
*/


//DEPENDENCIES
include 'restUtilities.php';
include 'datamodel.php';


//---===MAIN OPERATION===---\\


//RETRIEVE REQUEST INFORMATION
$method = $_SERVER['REQUEST_METHOD'];
$path = explode("/", $_SERVER['PATH_INFO']);
$pathLength = count($path);
$version = $path[1];
$call = $path[2];


//PROCESS REQUEST
if ($pathLength == 3) { //Means there are no parameters at the end of the path.
    if ($version == "v1" && $call == "properties") {
		if($method === "GET") {
			//DATAMODEL API CALL : selectAllProperties()
			//file_put_contents("log2.txt", "selecting Properties...");
			$output = selectAllProperties();
			
			//Dummy response
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the selectAllProperties() method.');
			//file_put_contents("log2.txt", "Done selecting Properties... " . $output['status'] . " - " . count($output['properties']));
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} else {
		//ERROR - INVALID PATH
		$output = invalidPath();
	}
} elseif ($pathLength == 4) { //Means there are parameters at the end of the path.
	$param = $path[3];
	if ($version == "v1" && $call == "properties" && $param == "add") {
		if ($method === "POST") {
			//DATAMODEL CALL : insertNewProperty($parameters from data)
			$body = (array) getJson();
			//$body = $_POST;
			$address = $body["address"];
			$description = $body["description"];
			$beds = $body["beds"];
			$baths = $body["baths"];
			//$managerName=$body["managerName"];
			//$city=$body["city"];
			//$state=$body["state"];
			//$zipCode=$body["zipCode"];
			$propertyType = $body["propertyType"];
			$name = $body["name"];
			$occupancy = $body["occupancy"];
			$apt_number = $body["apt_number"];
            
            $output = addProperty($address, $description, $beds, $baths, "unclaimed", 
				"Oxford", "Ohio", "45056", $propertyType, $name, $occupancy, $apt_number);
			/* $output = addProperty($address, $description, $beds, $baths, $managerName, 
				$city, $state, $zipCode, $propertyType, $name, $occupancy, $apt_number); */
			
			//Dummy response
            //file_put_contents("log2.txt", "sending response... HELLO");
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the insertNewProperty() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} 
    
    /* elseif ($version == "v1" && $call == "properties" && $param == "search") {
		if ($method === "POST") {
			//DATAMODEL API CALL : keywordSearch($body)
			//$body = (array) getJson();
			//$query = $body['query'];
			//$output = keywordSearch($query);
			
			//Dummy Response
			$output = array('status'=>'OK','msg'=>'this is a dummy response for the keywordSearch() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	}  */
    
    elseif ($version == "v1" && $call == "reviews" && $param == "add") {
		if ($method === "POST") {
			//DATAMODEL API CALL : insertNewReview($parameters from data)
			$body = (array) getJson();
			//$body = $_POST;
			$property = $body['propertyID'];
			$recommended = $body['recommended'];
			$rent = $body['rent'];
			$maintenance = $body['maintenance'];
			$neighborhood = $body['neighborhood'];
			$body = $body['body'];
			
			$output = addReview($recommended, $rent, $maintenance, $neighborhood, $body, $property);
			
			//Dummy response
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the insertNewReview() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} elseif ($version == "v1" && $call == "properties" && $param != "add") {
		if ($method === "GET") {
			//DATAMODEL API CALL : selectPropertyById($param)
			$output = findPropertyById($param);
			
			//Dummy response
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the selectPropertyById() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} elseif ($version == "v1" && $call == "reviews" && $param != "add") {
		if ($method === "GET") {
			//DATAMODEL API CALL : getReviewsById($param)
			$output = findReviewsById($param);
			
			//Dummy response
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the selectReviewById() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} else {
		//ERROR - INVALID PATH
		$output = invalidPath();
	}
} elseif ($pathLength == 5) {
	$subCall = $path[3];
	$param = $path[4];
	if ($version == "v1" && $call == "properties" && $subCall == "cat") {
		if($method === "GET") {
			//DATAMODEL API CALL : selectPropertiesByCategory($param)
			$output = selectPropertiesByCategory($param);
			
			//Dummy Response
			//$output = array('status'=>'OK','msg'=>'this is a dummy response for the keywordSearch() method.');
		} else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} elseif($version == "v1" && $call == "properties" && $subCall == "search"){
		if($method == "POST"){
			$output = keywordSearch($param);
		}else {
			//ERROR - INVALID METHOD
			$output = invalidMethod();
		}
	} else {
		//ERROR - INVALID PATH
		$output = invalidPath();
	}
} else {
	//ERROR - INVALID PATH
	$output = invalidPath();
}


//RESPONSE
header("content-type: application/json");
print json_encode($output);
file_put_contents("log.txt", json_last_error_msg());