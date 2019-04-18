/**
    ajaxTest.js
	@author kalebs, drews
	@version 0.4
	Description: JavaScript file containing all AJAX calls and operations for the UptownIndex project

*/

// --==HOST URL (CHANGE DEPENDING ON YOUR SETUP)==--
var HOST = "http://uptownindex:8080/";

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

function featuredProps() {
    const prop1 = "3";
    const prop2 = "2";
    const prop3 = "1";
    
    var xhttp1 = new XMLHttpRequest();
    xhttp1.onreadystatechange = function() {
        if (xhttp1.readyState == 4 && xhttp1.status == 200) {
            
            var result = JSON.parse(xhttp1.responseText);
            $("#Address1").append(result.address);
            $("#HouseName1").append(result.name)
            $("#bedNum1").append(result.beds);
            $("#bathNum1").append(result.baths);
        
            $("#photo1").attr("src", "../../" + result.photo);
        
            //$("#avgOverall").html(result.avgOverall);
        }
    };
    xhttp1.open("GET", HOST + "properties.php/v2/id/" + prop1, true);
    xhttp1.send();
    
    var xhttp2 = new XMLHttpRequest();
    xhttp2.onreadystatechange = function() {
        if (xhttp2.readyState == 4 && xhttp2.status == 200) {
            var result = JSON.parse(xhttp2.responseText);
            $("#Address2").append(result.address);
            $("#HouseName2").append(result.name)
            $("#bedNum2").append(result.beds);
            $("#bathNum2").append(result.baths);
        
            $("#photo2").attr("src", "../../" + result.photo);
        
            //$("#avgOverall").html(result.avgOverall);
        }
    };
    xhttp2.open("GET", HOST + "properties.php/v2/id/" + prop2, true);
    xhttp2.send();
    
    var xhttp3 = new XMLHttpRequest();
    xhttp3.onreadystatechange = function() {
        if (xhttp3.readyState == 4 && xhttp3.status == 200) {
            var result = JSON.parse(xhttp3.responseText);
            $("#Address3").append(result.address);
            $("#HouseName3").append(result.name)
            $("#bedNum3").append(result.beds);
            $("#bathNum3").append(result.baths);
        
            $("#photo3").attr("src", "../../" + result.photo);
        
            //$("#avgOverall").html(result.avgOverall);
        }
    };
    xhttp3.open("GET", HOST + "properties.php/v2/id/" + prop3, true);
    xhttp3.send();
}

function fetchProperties(xhttp) {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
        console.log()
        var result = JSON.parse(xhttp.responseText);
        
        console.log("Hi");
        if (result.status == "OK") {
            $(".propertyDiv").append($("<div/>").attr("id", "propCards").attr("class", "container"));
            //$("#propertyTable").attr("class", "table table-striped");
            const rowSize = 4;
            var currentRow;
            for (i = 0; i < result.properties.length - 1; i++) {
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
                var score = result.properties[i].avgOverall;
                if (score == 0.0) {
                    score = "-";
                }
                
                var temp = "#" + currentRow;
                $(temp).append(
                        $("<div/>").attr("class", "col")
                            .html("<div class=\"card bg-light mb-3\" style=\"width: 19rem; height: 23rem\">" + 
                            "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                            "<div class=\"card-body\">" + 
                            "<h5 class=\"card-title\">" + 
                            "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                            "</h5>" +
                            "<h4 class=\"scoreID\">" + score + " / 5" + "</h4>"
                             + "<p class=\"card-text\">" + "<b>Beds: </b> " + result.properties[i].beds +  
                            "<b> Baths:</b> " + result.properties[i].baths +"<br>" +
                            "</div>" +
                            "</div>" + "<br>")
                    );

                    var elem = document.getElementsByClassName('scoreID')[i];
                    if (score >= 4.0) {
                        elem.style.color = "#7ad63e";

                    }
                    else if (score >= 3.0) {
                        elem.style.color = "#edcf2a";
                    }
                    else if (score < 3.0) {
                        elem.style.color = "#CA6573";
                    }
                    else {
                        elem.style.color = "#b9c9a9";
                    }
                    
            }

        }
        else {
            console.log("Status: " + result.status + ", Msg: " + result.msg);
            alert("Uh oh! Something went wrong! Please try again.");
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
        
        
        var overall = result.avgOverall + "/5.0";
        var neig = result.avgNeig + "/5.0";
        var main = result.avgMain + "/5.0";
        var maintenanceBarSize = (result.avgMain /5.0) * 100;
        var neighborhoodBarSize = (result.avgNeig /5.0) * 100;
        
        
        if(result.avgOverall === "0.0") overall = "-/5.0";
        if(result.avgMain === "0.0") main = "-/5.0";
        if(result.avgNeig === "0.0") neig = "-/5.0";
        
        
        $("#avgOverall").html(overall);
        $("#avgMain").html(main);
        $("#avgNeig").html(neig);
        $("#neighborhoodBar").attr("style", "width: " + neighborhoodBarSize + "%; background-color: green;");
        $("#maintenanceBar").attr("style", "width: " + maintenanceBarSize + "%; background-color: #ec7e1e;");
        
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Uh oh! Something went wrong! Please try again.");
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
                            $("<div/>").attr("id", currentRow ).attr("class", "row no-gutters")
                    );
                }
                var score = result.properties[i].avgOverall;
                if (score == 0.0) {
                    score = "-";
                }
                
                var temp = "#" + currentRow;
                $(temp).append(
                    $("<div/>").attr("class", "col")
                        .html("<div class=\"card bg-light mb-3\" style=\"width: 19rem; height: 23rem\">" + 
                        "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                        "<div class=\"card-body\">" + 
                        "<h5 class=\"card-title\">" + 
                        "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                        "</h5>" +
                        "<h4 class=\"scoreID\">" + score + " / 5" + "</h4>"
                         + "<p class=\"card-text\">" + "<b>Beds: </b> " + result.properties[i].beds +  
                        "<b> Baths:</b> " + result.properties[i].baths +"<br>" +
                        "</div>" +
                        "</div>" + "<br>")
                );

                var elem = document.getElementsByClassName('scoreID')[i];
                    if (score >= 4.0) {
                        elem.style.color = "#7ad63e";

                    }
                    else if (score >= 3.0) {
                        elem.style.color = "#edcf2a";
                    }
                    else if (score < 3.0) {
                        elem.style.color = "#CA6573";
                    }
                    else {
                        elem.style.color = "#b9c9a9";
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
        
        $("#totalReviews").html(result.reviews.length + " Total Reviews");
        console.log("done");
        $("#ReviewListDiv").append($("<div/>"));
        for(i = result.reviews.length - 1; i >= 0; i--) {
            var main = result.reviews[i].maintenance;
            var neig = result.reviews[i].neighborhood;
            var rent = result.reviews[i].rent;
            if(result.reviews[i].recommended === "Recommend") {
                var rec = "far fa-thumbs-up";
                var sty = "color:green;";
            } else {
                var rec = "far fa-thumbs-down";
                var sty = "color:red;";
            }
            var body = result.reviews[i].body;
            $("#ReviewListDiv").append(
            "<div class=\"card\">" +
                "<div class=\"card-header\">" +
                    "<div class=\"recommend\" >" + "<i class=\'" + rec + "\'" + "style =\'" + sty  +"\'>" + "</i>" + "</div>" + 
                    "<div class=\"row-maintenance\">Maintenance: " + main + "</div>" +
                    "<div class=\"row-neighborhood\">Neighborhood: " + neig + "</div>" +
                    "<div class=\"row-rent\">Rent: " + rent + "$ per month" +"</div>" +
                "</div>" +
                "<div class=\"card-body\">" +
                    "<p class=\"comment\">" + body + "</p>" + 
                "</div>" + 
            "</div>"
            );
        }
    } else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        var noReviewsElement = "<p style=\"text-align: center\"/>";
        var noReviewsMsg = "<b>There are no reviews for this property. Be the first to leave a review!</b>";
        $("#ReviewListDiv").append($(noReviewsElement).html(noReviewsMsg));
    }
}

function fetchPropertiesByCategory(xhttp) {
    var result = JSON.parse(xhttp.responseText);

    console.log(result);

    if (result.status == "OK") {
        $(".propertyDiv").append($("<div/>").attr("id", "propCards").attr("class", "container"));
        const rowSize = 4;
        var currentRow;
        
        for (i = 0; i < result.properties.length - 1; i++) {
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
            var score = result.properties[i].avgOverall;
            if (score == 0.0) {
                score = "-";
            }
            
            var temp = "#" + currentRow;
            $(temp).append(
                    $("<div/>").attr("class", "col")
                        .html("<div class=\"card bg-light mb-3\" style=\"width: 19rem; height: 23rem\">" + 
                        "<img class=\"card-img-top\" src=\"../../" + result.properties[i].photo + "\" height=\"200\">" + 
                        "<div class=\"card-body\">" + 
                        "<h5 class=\"card-title\">" + 
                        "<a href=\"" + HOST + "html/forms/listing.html?id=" + result.properties[i].id + "\">" + name + "</a>" + 
                        "</h5>" +
                        "<h4 class=\"scoreID\">" + score + " / 5" + "</h4>"
                         + "<p class=\"card-text\">" + "<b>Beds: </b> " + result.properties[i].beds +  
                        "<b> Baths:</b> " + result.properties[i].baths +"<br>" +
                        "</div>" +
                        "</div>" + "<br>")
                );

                var elem = document.getElementsByClassName('scoreID')[i];
                if (score >= 4.0) {
                    elem.style.color = "#7ad63e";

                }
                else if (score >= 3.0) {
                    elem.style.color = "#edcf2a";
                }
                else if (score < 3.0) {
                    elem.style.color = "#CA6573";
                }
                else {
                    elem.style.color = "#b9c9a9";
                }
                
            
        }

    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Uh oh! Something went wrong! Please try again.");
    }
}

function postProperty(xhttp) {
    console.log(xhttp.responseText);
    var result = JSON.parse(xhttp.responseText);
    console.log("response received");
    
    if(result.status == "OK") {
        console.log("Property Posted");
        alert("Thank you! Your property posting has been received!");
        window.location.href = 'properties.html';
    } else {
        console.log("Error: status= " + result.status + ", msg= " + result.msg);
        alert("Uh oh! Something went wrong when submitting the property! Please try again.");
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
        alert("Thank you! Your review has been sucessfully posted!");
        window.location.href = 'listing.html?id=' + id;

    } else {
        console.log("Error: status= " + result.status + ", msg= " + result.msg);
        alert("Uh oh! Something went wrong when posting your review! Please try again.");
    }
}