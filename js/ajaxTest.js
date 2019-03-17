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

function ajaxPost(url, data, callbackFunction) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            callbackFunction(this);
        }
    };
    xhttp.open("POST", HOST + url, true);
    xhttp.send(data);
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

function postProperty(xhttp) {
    console.log(xhttp.responseText);
    var result = JSON.parse(xhttp.responseText);
    console.log("response received");
    
    if(result.status == "OK") {
        console.log("Property Posted");
        alert("Property successfully posted!");
    } else {
        console.log("Error: status= " + result.status + ", msg= " + result.msg);
        alert("FAILURE");
    }
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