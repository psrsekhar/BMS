var Request = {

    showError: function (message, div) {
        message = "<div class='alert alert-danger'><strong>" + message + "</strong></div>";
        jQuery("#" + div).html(message);
    },

    showSuccess: function (message, div) {
        message = "<div class='alert alert-success'><strong>" + message + "</strong></div>";
        jQuery("#"+div).html(message);
    },

    post: function (url, data) {
        var responseData = null;
        jQuery.ajax(
            {
                url: url,
                headers: { "RequestVerificationToken": $("input[name=__RequestVerificationToken]").val()},
                type: 'post',
                data: JSON.stringify(data),
                dataType: 'json',
                timeout: 800000,
                async: false,
                cache: false,
                processData: false,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    responseData = response;
                },
                error: function () {
                    Request.showError("<strong>Oops!</strong> Try that again in a few moments.");
                }
            });
        return responseData;
    }
};