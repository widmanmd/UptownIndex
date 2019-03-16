/**
    ajaxTest.js
	@author kalebs, drews
	@version 0.4
	Description: JavaScript file containing all AJAX calls and operations for the UptownIndex project

*/

// --==HOST URL (CHANGE DEPENDING ON YOUR SETUP)==--
var HOST = "http://localhost:8080/";

//--AJAX CALLS

function ajaxGet(url, callbackFunction) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            callbackFunction(this);
        }
    };
    xhttp.open("GET", HOST + url, true);
    xhttp.send();
}

function ajaxPost(url, callbackFunction) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            callbackFunction(this);
        }
    };
    xhttp.open("POST", HOST + url, true);
    xhttp.send();
}

function fetchProperties(xhttp) {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
        var result = JSON.parse(xhttp.responseText);
        console.log("Hi");
        if (result.status == "OK") {
            $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
            $("#propertyTable").attr("class", "table table-striped");
    
            for (i = 0; i < result.properties.length; i++) {
                name = result.properties[i].name;
                address = result.properties[i].address;
                if (name === "null") {
                    name = address;

                    $("#propertyTable").append(
                        $("<tbody/>")
                            .html("<tr><td>" + "<a href=\"" + HOST + "html/forms/listing.html?id=" + 
                            result.properties[i].id + "\">" + name + "</a>" + "</td><td>" +
                            "Bedrooms: " + result.properties[i].beds + "<br>" + "Bathrooms: " + result.properties[i].baths
                            + "</td></tr>")
                    );
                }
                else {
                    $("#propertyTable").append(
                        $("<tbody/>")
                            .html("<tr><td>" + "<a href=\"" + HOST + "html/forms/listing.html?id=" + 
                            result.properties[i].id + "\">" + name + "</a>" + 
                            "<br>" + address + "</td><td>" +
                            "Bedrooms: " + result.properties[i].beds + "<br>" + "Bathrooms: " + result.properties[i].baths
                            + "</td></tr>")
                    );
                }

                
            }
        }
        else {
            console.log("Status: " + result.status + ", Msg: " + result.msg);
            alert("Unknown Error. Check console.");
        }
    }
}

function fetchPropertyByID(xhttp) {
    var result = JSON.parse(xhttp.responseText);

    console.log(result);
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

function fetchByKey(xhttp) {
        var result = JSON.parse(xhttp.responseText);

        console.log(result);
        if (result.status == "OK") {
            $(".countMessage").html("<h4>"+ result.count + 'results found.'+"</h4>");
            $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
            $("#propertyTable").attr("class", "table table-striped");

            for (i = 0; i < result.properties.length; i++) {
                $("#propertyTable").append($("<tbody/>")
                .html("<tr><td>" + result.properties[i].address + "</td><td>" +
                "<a href=\"" + HOST + "/html/forms/listing.html?id=" + result.properties[i].id + "\">Click Here!</a>"
                + "</td></tr>")
                );
            }
        } else {
            $(".countMessage").html("<h4>"+'No matching results found.'+"</h4>");
            console.log("Status: " + result.status + ", Msg: " + result.msg);
        }
}
 
function fetchReviewsForProperty(xhttp) {
    var result = JSON.parse(xhttp.responseText);

    console.log(result);
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

function fetchPropertiesByCategory(xhttp) {
    var result = JSON.parse(xhttp.responseText);

    console.log(result);

    if (result.status == "OK") {
        $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
        $("#propertyTable").attr("class", "table table-striped");

        for (i = 0; i < result.properties.length; i++) {
            $("#propertyTable").append(
                $("<tbody/>")
                    .html("<tr><td>" + "<a href=\"" + HOST + "html/forms/listing.html?id=" + 
                    result.properties[i].id + "\">" + result.properties[i].name + "</a>" + 
                    "<br>" + result.properties[i].address + "</td><td>" +
                     "Bedrooms: " + result.properties[i].beds + "<br>" + "Bathrooms: " + result.properties[i].baths
                    + "</td></tr>")
            );
        }
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }
}

/** fetchProperties()
    AJAX call to fetch list of all properties. See REST-API-CALLS.txt for more
        information.
*/

/* function fetchProperties() {

    console.log("calling fetchProperties()...");

    $.ajax( {
        url: HOST + "properties.php/v2/all",
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
"properties.php/v2/search/keyword=" + key
} */

/* function fetchByKey(key){
    console.log("keyword=" + key);

    $.ajax( {
        url: HOST + "properties.php/v2/search/" + key,
        type: "POST",
        dataType: "JSON",
        success: function(result) {
			console.log("success! count = " + result.count);
			fetchByKeySuccess(result);
		},
        failure: function(xhr) {
			ajaxFailure(xhr);
		}
    });
} */

/**
function fetchPropertiesByCategory(cat) {

    console.log("calling fetchPropertiesByCategory()...");

    $.ajax( {
        url: HOST + "properties.php/v2/by/" + cat,
        type: "GET",
        dataType: "JSON", 
        success: function(result) {
            console.log("AJAX Success");
            fetchPropertiesSuccess(result);
        }, 
        failure: function(xhr) {
            ajaxFailure(xhr);
        }
    });
}

 */

/** fetchPropertyByID(id)
    AJAX call to fetch property information, given a propertyID. See REST-API-CALLS.txt for more
        information.
	@param integer id value
*/

/** 
function fetchPropertyByID(id) {
    $.ajax( {
        url: HOST + "properties.php/v2/id/" + id,
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
*/

/** fetchReviewsByID(9d)
    AJAX call to fetch all reviews for a given propertyID. See REST-API-CALLS.txt for more
        information.
	@param integer id value
*/

/** 
function fetchReviewsForProperty(id) {
	console.log("Fetching Reviews...");
    $.ajax( {
        url: HOST + "reviews.php/v2/id/" + id,
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
*/

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
        url: HOST + "reviews.php/v2/add",
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
    var obj = {address: address, name: name, description: description, occupancy: tenants, beds: bedNum, baths: bathNum, propertyType: apt, apt_number: aptNum};
    var objJSON = JSON.stringify(obj);
    console.log("Posting Property...")
    $.ajax( {
        url: HOST + "properties.php/v2/add",
        type: "POST",
        dataType: "JSON",
        data: objJSON,
        success: function(result) {
            console.log("Success! msg= " + result.msg);
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
    console.log("Property has been added");
    alert("Property Successfully Added!");
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
                    .html("<tr><td>" + "<a href=\"" + HOST + "html/forms/listing.html?id=" + 
                    result.properties[i].id + "\">" + result.properties[i].name + "</a>" + 
                    "<br>" + result.properties[i].address + "</td><td>" +
                     "Bedrooms: " + result.properties[i].beds + "<br>" + "Bathrooms: " + result.properties[i].baths
                    + "</td></tr>")
            );
        }
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }

}

function fetchByKeySuccess(result){
    console.log(result);
    if (result.status == "OK") {
            $(".countMessage").html("<h4>"+ result.count + 'results found.'+"</h4>");
            $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
            $("#propertyTable").attr("class", "table table-striped");

                for (i = 0; i < result.properties.length; i++) {
                    $("#propertyTable").append($("<tbody/>")
                    .html("<tr><td>" + result.properties[i].address + "</td><td>" +
                     "<a href=\"" + HOST + "/html/forms/listing.html?id=" + result.properties[i].id + "\">Click Here!</a>"
                    + "</td></tr>")
                );
            }
        }else {
        $(".countMessage").html("<h4>"+'No matching results found.'+"</h4>");
        console.log("Status: " + result.status + ", Msg: " + result.msg);
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