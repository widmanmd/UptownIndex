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
            $(".propertyDiv").append($("<div/>").attr("id", "propCards").attr("class", "container"));
            //$("#propertyTable").attr("class", "table table-striped");
            const rowSize = 4;
            var currentRow;
            for (i = 0; i < result.properties.length; i++) {
                //var prop = result.properties[i];
                var name = result.properties[i].name;
                if (name == null) {
                    name = result.properties[i].address;
                }
                
                if( i % rowSize == 0) {
                    currentRow = "propRow" + (i/rowSize);
                    $("#propCards").append(
                            $("<div/>").attr("id", currentRow ).attr("class", "row no-gutters")
                    );
                    
                }
                
                var temp = "#" + currentRow;
                $(temp).append(
                        $("<div/>").attr("class", "col")
                            .html("<div class=\"card bg-light mb-3\" style=\"width: 18rem; height: 23rem\">" + 
                            "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                            "<div class=\"card-body\">" + 
                            "<h5 class=\"card-title\">" + 
                            "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                            "</h5>" +
                            "<p class=\"card-text\">" + "<b>Beds:</b> " + result.properties[i].beds +  
                            " <b>Baths:</b> " + result.properties[i].baths +"<br>" + "<b>Average rating:</b> " + result.properties[i].avgOverall + 
                            "</div>" +
                            "</div>" + "<br>" )
                    );

                
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
        $("#photo").attr("src", "../../" + result.photo);
        $("#avgMain").html(result.avgMain);
        $("#avgNeig").html(result.avgNeig);
        $("#avgOverall").html(result.avgOverall);
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
            $(".propertyDiv").append($("<div/>").attr("id", "propCards").attr("class", "container"));
    
            const rowSize = 4;
            var currentRow;
            for (i = 0; i < result.properties.length; i++) {
                var name = result.properties[i].name;
                if (name == null) {
                    name = result.properties[i].address;
                }
                
                if(i%rowSize == 0) {
                    currentRow = "propRow" + (i/rowSize);
                    $("#propCards").append(
                            $("<div/>").attr("id", currentRow ).attr("class", "row")
                    );
                }
                
                var temp = "#" + currentRow;
                $(temp).append(
                        $("<div/>").attr("class", "col")
                        .html("<div class=\"card bg-light mb-3\" style=\"width: 18rem; height: 23rem\">" + 
                        "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                            "<div class=\"card-body\">" + 
                            "<h5 class=\"card-title\">" + 
                            "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                            "</h5>" +
                            "<p class=\"card-text\">" + "<b>Beds:</b> " + result.properties[i].beds +  
                            " <b>Baths:</b> " + result.properties[i].baths +"<br>" + "<b>Average rating:</b> " + result.properties[i].avgOverall + 
                            "</div>" +
                            "</div>" )
                    );
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
        $("#ReviewListDiv").append($("<div/>").attr("id", "reviewCards").attr("class", "container"));
		for(i = result.reviews.length - 1; i >= 0; i--) {
			var main = result.reviews[i].maintenance;
			var neig = result.reviews[i].neighborhood;
			var rent = result.reviews[i].rent;
			if(result.reviews[i].recommended == 1) {
				var rec = "Recommended";
			} else {
				var rec = "Do Not Rcommend";
			}
			var body = result.reviews[i].body;
            $("#reviewCards").append(
            "<div class=\"card-group\">" +
            "<div class=\"card\" >" + 
            "<div class=\"card-body\">" +
            "<h5 class=\"card-title\">Maintenance: " + main + "</h5>" +
            "<h5 class=\"card-title\">Neighborhood: " + neig + "</h5>" +
            "</div></div>" +
            "<div class=\"card\" style=\"flex-grow: 2;\">" +
            "<div class=\"card-body\">" + 
            "<h6 class=\"card-title\">Rent: " + rent + "</h6>" + 
            "<h6 class=\"card-title\">" + rec + "</h6>" + 
            "<p class=\"card-text\">" + body + "</p>" + 
            "</div></div></div>"
            );
            
            
            
			/* $("#ReviewListDiv").append(
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
			); */
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
        $(".propertyDiv").append($("<div/>").attr("id", "propCards").attr("class", "container"));
        const rowSize = 4;
        var currentRow;
        
        for (i = 0; i < result.properties.length; i++) {
            var name = result.properties[i].name;
                if (name == null) {
                    name = result.properties[i].address;
                }
                
                if(i%rowSize == 0) {
                    currentRow = "propRow" + (i/rowSize);
                    $("#propCards").append(
                            $("<div/>").attr("id", currentRow ).attr("class", "row")
                    );
                }
                
                var temp = "#" + currentRow;
                $(temp).append(
                        $("<div/>").attr("class", "col")
                        .html("<div class=\"card bg-light mb-3\" style=\"width: 18rem; height: 23rem\">" + 
                        "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                            "<div class=\"card-body\">" + 
                            "<h5 class=\"card-title\">" + 
                            "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                            "</h5>" +
                            "<p class=\"card-text\">" + "<b>Beds:</b> " + result.properties[i].beds +  
                            " <b>Baths:</b> " + result.properties[i].baths +"<br>" + "<b>Average rating:</b> " + result.properties[i].avgOverall + 
                            "</div>" +
                            "</div>" + "<br>" )
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
        window.location.href = 'properties.html';
    } else {
        console.log("Error: status= " + result.status + ", msg= " + result.msg);
        alert("FAILURE");
    }
}

function postReview(xhttp) {
    console.log(xhttp.responseText);
    var result = JSON.parse(xhttp.responseText);
    console.log("response received");
    
    if(result.status == "OK") {
        console.log("Review Posted");
        var idString = window.location.href; 
        var id = idString[idString.length - 1];
        alert("Review successfully posted!!");
        window.location.href = 'listing.html?id=' + id;

    } else {
        console.log("Error: status= " + result.status + ", msg= " + result.msg);
        alert("FAILURE");
    }
}
