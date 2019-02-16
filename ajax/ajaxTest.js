function fetchProperties() {
    $.ajax( {
        url: "http://test-build:8080/rest.php/v1/properties",
        type: "GET",
        dataType: "JSON",
        success: fetchPropertiesSuccess(result),
        failure: ajaxFailure(xhr),
    });

}

function fetchPropertyByID(id) {
    $.ajax( {
        url: "http://test-build:8080/rest.php/v1/properties/" + id,
        type: "GET",
        dataType: "JSON",
        success: fetchPropertyByIDSuccess(result),
        failure: ajaxFailure(xhr),
    });

}

function fetchReviewsForProperty(id) {
    $.ajax( {
        url: "http://test-build:8080/rest.php/v1/reviews/" + id,
        type: "GET",
        dataType: "JSON",
        success: fetchReviewsForPropertySuccess(result),
        failure: ajaxFailure(xhr),
    });

}

function postReview(id, rent, maintenance, location, recommended, comments) {

    var obj = {propertyID: id, rentAmt: rent, maintenanceRating: maintenance, locationRating: location, recommended: recommended, body: comments};
    var objJSON = JSON.stringify(obj);

    $.ajax( {
        url: "http://test-build:8080/rest.php/v1/reviews/add",
        type: "POST",
        dataType: "JSON",
        data: objJSON,
        success: fetchPropertiesSuccess(result),
        failure: ajaxFailure(xhr),
    });

}

function postProperty(address, apt, aptNum, name, bedNum, bathNum, tenants, description) {

    var obj = {address: address, name: name, description: description, occupancy: tenants, beds: bedNum, bath: bathNum, apartment: apt, aptNum: aptNum};
    var objJSON = JSON.stringify(obj);

    $.ajax( {
        url: "http://test-build:8080/rest.php/v1/properties/add",
        type: "POST",
        dataType: "JSON",
        data: objJSON,
        success: fetchPropertiesSuccess(result),
        failure: ajaxFailure(xhr),
    });

}

function fetchReviewsForPropertySuccess(result) {
    if (result.status == "OK") {
        $("#description").append(result.reviews.description);
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }
}

function fetchPropertyByIDSuccess(result) {
    if (result.status == "OK") {
        $("#Address").append(result.properties.address);
    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }
}

function fetchPropertiesSuccess(result) {
    if (result.status == "OK") {
        $(".propertyDiv").append($("<table/>").attr("id", "propertyTable"));
        $("#propertyDiv").attr("class", "table table-striped");

        for (i = 0; i < result.properties.length; i++) {
            $("#propertyTable").append(
                $("<tbody/>")
                    .html("<tr><th scope=\"row\">" + result.properties[i].address + "</th><td>" + result.properties[i].name + "</td><tr>")
            );
        }

    }
    else {
        console.log("Status: " + result.status + ", Msg: " + result.msg);
        alert("Unknown Error. Check console.");
    }

}

function ajaxFailure(xhr) {
    alert("Server error");
    console.log("ajax request failed");
    console.log("Error: " + xhr.statusText);
    console.log("Status: " + xhr.status);
    console.log(xhr.responseText);
}