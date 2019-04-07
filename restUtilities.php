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

function processFiles($files) {
    $path = 'uploads/';
    $file = $path . "default.png";
        
    if(isset($files['files'])&& $files['files']['tmp_name'][0] != "") {
        $errors = [];
        $extensions = ['jpg', 'jpeg', 'png'];
    
        $all_files = count($files['files']['tmp_name']);
        file_put_contents("log.txt", $files['files']['tmp_name'][0]);
        for ($i = 0; $i < $all_files; $i++) {
            $file_name = $files['files']['name'][$i];
            $file_tmp = $files['files']['tmp_name'][$i];
            $file_type = $files['files']['type'][$i];
            $file_size = $files['files']['size'][$i];
            $exploded = explode('.', $files['files']['name'][$i]);
            $file_ext = strtolower(end($exploded));
            
            $file = $path . strtotime("now") . $file_name;
            
            if (!in_array($file_ext, $extensions)) {
                $errors[] = 'Invalid Extension : ' . $file_name . ' ' . $file_type;
            }
            
            if ($file_size > 2097152) {
                $errors[] = 'File Exceeds Size Restriction : ' . $file_name . ' ' . $file_size;
            }
            
            if (empty($errors)) {
                move_uploaded_file($file_tmp, $file);
            }
        }
        
        if($errors) {
            $output = array('status'=>'FAIL', 'msg'=>'FILE UPLOAD FAILURE', 'errors'=>$errors);
        } else {
            $output = array('status'=>'OK', 'msg'=>'SUCCESS', 'photo'=>$file);
        }
    } else {
        $output = array('status'=>'OK', 'msg'=>'NO FILES TO UPLOAD', 'photo'=>$file);
    }
    
    return $output;
}