<?php 

define('LOCATION', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', '');
define('DBNAME', 'uptown_index_test');
define('PORT', '3306');

include 'datamodel.php';

$output = addReview(true, 500, 3, 3, "TESTCONNECTION.PHP", 3);

echo $output['status'] . " " . $output['msg'];
/* function selectAllProperties() 
{
	//Remove and replace with connection method, if available.
	$mysqli = mysqli_connect(LOCATION, USERNAME,PASSWORD,DBNAME);
	if (mysqli_connect_errno($mysqli)) {
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
			return array('status'=>'FAIL', 'msg'=>'Failed to connect to MySQL: ' . mysqli_connect_error());
				die;
	}
	
	$stmt = $mysqli->prepare("SELECT * FROM property;");
	if(!$stmt->execute()) {
		//echo "error executing query" . $stmt->error;
		return array('status'=>'FAIL', 'msg'=>"error executing query" . $stmt->error);
	} else {
		$stmt->bind_result($pk, $address, $description,$beds, $baths, $manager, $city, $state, $zip, $propertyType, $name, $occupancy, $aptNumber);
		$propertyList = array();
		while($stmt->fetch()) {
			$property = array('id'=>$pk, 'address'=>$address, 'beds'=>$beds, 'baths'=>$baths, 'manager'=>$manager, 'city'=>$city, 'state'=>$state, 
						'zip'=>$zip, 'propertyType'=>$propertyType, 'name'=>$name, 'occupancy'=>$occupancy, 'aptNumber'=>$aptNumber);
			array_push($propertyList, $property);
			
			//Can use for debugging. Remove before release.
			//echo $pk . ", " . $address . ", " . $description;
		}
		
		//Extra check to protect against unintended side effects
		if (count($propertyList) == 0) {
			return array('status'=>'FAIL', 'msg'=>"No Properties Found");
		} else {
			return array('status'=>'OK', 'msg'=>'Success', 'properties'=>$propertyList);
		}
	}
} */
?>