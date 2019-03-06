/**
    ajaxTest.js
	@author kalebs, drews
	@version 0.4
	Description: JavaScript file containing all AJAX calls and operations for the UptownIndex project

*/

// --==HOST URL (CHANGE DEPENDING ON YOUR SETUP)==--
var HOST = "http://uptownindex:8080/htdocs/";

//--AJAX CALLS

/** fetchProperties()
    AJAX call to fetch list of all properties. See REST-API-CALLS.txt for more
        information.
*/
function fetchProperties() {

    console.log("calling fetchProperties()...");

    $.ajax( {
        url: HOST + "rest.php/v1/properties",
        type: "GET",
        dataType: "JSON",
        success: function(result) {
            console.log(result.status);
            fetchPropertiesSuccess(result);
        },
        failure: function(xhr) {
            ajaxFailure(xhr);
        }
    });

}

/** fetchPropertyByID(id)
    AJAX call to fetch property information, given a propertyID. See REST-API-CALLS.txt for more
        information.
	@param integer id value
*/
function fetchPropertyByID(id) {
    $.ajax( {
        url: HOST + "rest.php/v1/properties/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(result) {
			console.log("AJAX Success");
			fetchPropertyByIDSuccess(result);
		},
        failure: function (xhr) {
			ajaxFailure(xhr);
		}
    });

}

/** fetchReviewsByID(9d)
    AJAX call to fetch all reviews for a given propertyID. See REST-API-CALLS.txt for more
        information.
	@param integer id value
*/
function fetchReviewsForProperty(id) {
	console.log("Fetching Reviews...");
    $.ajax( {
        url: HOST + "rest.php/v1/reviews/" + id,
        type: "GET",
        dataType: "JSON",
        success: function (result) {
			console.log(result.status);
			fetchReviewsForPropertySuccess(result);
		},
        failure: function (xhr) {
			ajaxFailure(xhr);
		}
    });

}

/** postReview(id, rent, maintenance, location, recommended, comments)
    AJAX call to send review information to the server. See REST-API-CALLS.txt for more
        information.
	@param integer id value
	@param integer rent value, must not be negative or zero
	@param integer maintenance value, must be between 1 and 5, inclusively.
	@param integer location value, must be between 1 and 5, inclusively.
	@param boolean recommended value
	@param string body of review, must be fewer than 300 characters.
*/
function postReview(id, rent, maintenance, location, recommended, comments) {
	console.log("postReview: id=" + id);
    var obj = {propertyID: id, rent: rent, maintenance: maintenance, neighborhood: location, recommended: recommended, body: comments};
    var objJSON = JSON.stringify(obj);

    $.ajax( {
        url: HOST + "rest.php/v1/reviews/add",
        type: "POST",
        dataType: "JSON",
        data: objJSON,
        success: function(result) {
			console.log("success!")
			postReviewSuccess(result);
		},
        failure: function(xhr) {
			ajaxFailure(xhr);
		}
    });

}

/** postProperty(address, apt, aptNum, name, bedNum, bathNum, tenants, description)
    AJAX call to send new property information to the server. See REST-API-CALLS.txt for more
        information.
	@param string address value
	@param string propertyType value, must be either 'HOUSE' or 'APARTMENT'
	@param integer apartment number, if property is not an apartment, default to 0.
	@param string name value, if none given, default to address
	@param integer number of bedrooms, must be greater than zero.
	@param integer number of bathrooms, must be greater than zero.
	@param integer number of tenants, must be greater than zero.
	@param string description of property, must be fewer than 500 characters.
*/
function postProperty(address, apt, aptNum, name, bedNum, bathNum, tenants, description) {
    console.log("posting property... propertyType = " + apt);
    var obj = {address: address, name: name, description: description, occupancy: tenants, beds: bedNum, baths: bathNum, propertyType: apt, apt_number: aptNum};
    var objJSON = JSON.stringify(obj);

    $.ajax( {
        url: HOST + "rest.php/v1/properties/add",
        type: "POST",
        dataType: "JSON",
        data: objJSON,
        success: function(result) {
            console.log("success");
            postPropertySuccess(result);
        },
        failure: function(xhr) {
            ajaxFailure(xhr);
        }
    });

}


//--RESULT PROCESSING METHODS

/** postReviewSuccess(result)
    result processer for posting a review.
	@param result, associative array.
*/
function postReviewSuccess(result) {
	if(result.status == "OK") {
		console.log("Review posted successfully"); 
		alert("Review Successfully Posted!");
	} else {
		console.log("Error! status: " + result.status + ", msg: " + result.msg); 
		alert("Error occurred. Check console.");
	}
    

}

/** postPropertySuccess(result)
    result processer for adding a new property.
	@param result, associative array.
*/
function postPropertySuccess(result) {
    if(result.status == "OK") {
		console.log("Property posted successfully"); 
		alert("Property Successfully Posted!");
	} else {
		console.log("Error! status: " + result.status + ", msg: " + result.msg); 
		alert("Error occurred. Check console.");
	}
}

/** fetchReviewsForPropertySuccess(result)
    result processer for fetching reviews for a proeprty.
	@param result, associative array.
*/
function fetchReviewsForPropertySuccess(result) {
    if (result.status == "OK") {
		console.log("done");
		for(i = result.reviews.length - 1; i >= 0; i--) {
			var main = result.reviews[i].maintenance;
			var neig = result.reviews[i].neighborhood;
			var rent = result.reviews[i].rent;
			if(result.reviews[i].recommended == true) {
				var rec = "Yes";
			} else {
				var rec = "No";
			}
			var body = result.reviews[i].body;
			$("#ReviewListDiv").append(
			"<div class=\"review-div mdl-grid\">" +
				"<div class=\"mdl-cell mdl-cell--4-col\" style=\"border-style: solid; border-width: 5px;\">" + 
					"<div style=\"padding: 5%\">" + 
						"<h3 class=\"overall\">Overall Rating:  <b>5</b></h3>" + 
						"<h3 class=\"maintenance\">Maintenance: <b>"+ main +"</b></h3>" + 
						"<h3 class=\"neighborhood\">Neighborhood: <b>"+ neig +"</b></h3>" + 
					"</div>" +
				"</div>" + 
				"<div class=\"mdl-cell mdl-cell--8-col\" style=\"border-style: solid; border-width: 5px;\">" + 
					"<h5><b>Rent: " + rent + "</b></h5><p class=\"rentVal\"></p>  <h5><b>Recommended: " + rec + "</b></h5><p class=\"recVal\"></p>" +
					"<h6>Comments: </h6><p class=\"bodyVal\">" + body + "</p>" +
				"</div>" +
			"</div>"
			);
		}
    } else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }
}

/** fetchPropertyByIDSuccess(result)
    result processer for fetching a specific property.
	@param result, associative array.
*/
function fetchPropertyByIDSuccess(result) {
    if (result.status == "OK") {
        $("#Address").append(result.address);
        $("#HouseName").append(result.name)
        $("#bedNum").append(result.beds);
        $("#bathNum").append(result.baths);
        $("#description").append(result.description);
        $("#occupancy").append(result.occupancy);

    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }
}

/** fetchPropertiesSuccess(result)
    result processer for fetching all properties.
	@param result, associative array.
*/
function fetchPropertiesSuccess(result) {
    console.log("Hi");
    if (result.status == "OK") {
        $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
        $("#propertyTable").attr("class", "table table-striped");

        for (i = 0; i < result.properties.length; i++) {
            $("#propertyTable").append(
                $("<tbody/>")
                    .html("<tr><td>" + result.properties[i].address + "</td><td>" +
                     "<a href=\"" + HOST + "/html/forms/listing.html?id=" + result.properties[i].id + "\">Click Here!</a>"
                    + "</td></tr>")
            );
        }
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }

}

/** ajaxFailure(xhr)
    catch-all AJAX failure method. Logs returned error information and alerts user to error.
    @param xhr, returned error object when AJAX call fails.
*/
function ajaxFailure(xhr) {
    alert("Server error");
    console.log("ajax request failed");
    console.log("Error: " + xhr.statusText);
    console.log("Status: " + xhr.status);
    console.log(xhr.responseText);
}