<?php
/* RestUtilities.php
    DESCRIPTION: This file contains a utility functions for the Uptown-Index project REST API
	@author : drews
	@version 0.2
*/

//JSON HELPER FUNCTION
function getJson() 
{
	$jsonStringIn = file_get_contents('php://input');
	$json = array();
	$response = array();
	try {
		$json = json_decode($jsonStringIn,true);
		return $json;
	}
	catch (Exception $e) {
		
		header("HTTP/1.0 500 Invalid content -> probably invalid JSON format");
		$response['status'] = "fail";
		$response['message'] = $e->getMessage();
		print json_encode($response);
		exit;
	}

}

//ERROR RESPONSE FUNCTION - INVALID PATH
function invalidPath()
{
	//header("HTTP/1.1 404 Not Found");
	$output['status'] = 'FAIL';
	$output['msg'] = 'INVALID PATH';
	
	return $output;
}

//ERROR RESPONSE FUNCTION - INVALID METHOD
function invalidMethod()
{
	//header("HTTP/1.1 405 Method Not Allowed");
	$output['status'] = 'FAIL';
	$output['msg'] = 'INVALID METHOD';
}

//ERROR RESPONSE FUNCTION - INVALID CALL
function invalidCall()
{
	//header("HTTP/1.1 404 Not Found");
	$output['status'] = 'FAIL';
	$output['msg'] = 'INVALID PATH OR METHOD';
}

