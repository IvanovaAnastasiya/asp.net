/// <reference path="jquery-2.0.3.js" />
(function () {
    $(function () {
        var holder = $("#employees-list");
        var detailsElement = $("#details-element");

        holder
        .on("mouseover", ".employee-holder", function (e) {
            var id = $(e.currentTarget).data("employee-id");

            $.getJSON("/api/details/" + id).success(function (result) {
                detailsElement.html("Address: " + result.address + "<br />Notes: " + result.notes);
            });
        })
    })    
}())

function getDetails(id)
{
    var detailsElement = $("#details-element");

    $.getJSON("/api/details/" + id).success(function (result) {
        detailsElement.html("Address: " + result.address + "<br />Notes: " + result.notes);
    });
}