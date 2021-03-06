// Set up the UI/UX for the Division/Battalion screens.  This object sets up all the functionality we need to:
//  1.  Bind to the "click" event of the "#addButton" on the modal form.
//  2.  Append data from the modal form to the Battalions table.
//  3.  Hide the modal form when the user is done entering data.
//
// If any other events need to be wired up, the init function would be the place to put them.
var battalionFieldsUI = {
    init: function() {
        // Configuration for the jQuery validator plugin:
        // Set the error messages to appear under the element that has the error.  By default, the
        // errors appear in the all-too-familiar bulleted-list.
        // Other configuration options can be seen here:  https://github.com/victorjonsson/jQuery-Form-Validator
        var validationSettings = {
            errorMessagePosition : 'element'
        };

        // Run validation on an input element when it loses focus.
        $('#new-battalion-fields').validateOnBlur();

        $('#addButton').on('click', function(e) {
            // If the form validation on our Battalion modal "form" fails, stop everything and prompt the user
            // to fix the issues.
            var isValid = $('#new-battalion-fields').validate(false, validationSettings);
            if(!isValid) {
                e.stopPropagation();

                return false;
            }

            formHandler.appendFields();
            formHandler.hideForm();
        });
    }
};

// Configuration for the Add/Edit Division screen's functionality:
//  formId:  The ID of the <FORM> that contains the input fields that need to be captured and appended to the table of Battalions.
//  tableId:  The ID of the <TABLE> that represents the Battalions assigned to a particular Division.
//  inputFieldClassSelector:  The CSS class that is assigned to all the data entry/input fields that need to be collected
//      for appending to the Battalions table (and ultimately for saving to the database).
//  getTBodySelector:  A VERY simple method that concatenates the cfg.tableId and " tbody" to build the selector we need
//      to identify the <TABLE> where we'll be appending rows.
var cfg = {
    formId: '#new-battalion-fields',
    tableId: '#battalions-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        console.log(this.tableId);
        return this.tableId + ' tbody';
    }
};

// Provides functionality to append new rows to the Battalions table and hide the modal form for adding new Battalions.
// NOTE:  The "appendFields" function depends on the rowBuilder to handle building the HTML for the new row.
var formHandler = {
    // Public method for adding a new row to the table.
    appendFields: function () {

        // Get a handle on all the input fields in the form and detach them from the DOM (we'll attach them later).
        //var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        var inputFields = $('#new-battalion-fields :input').not(':button');
        console.log('fields in inputFields: ' + inputFields.length);
        inputFields.detach();
        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);

        // Add the "Remove" link to the last cell.
        console.log(rowBuilder.link);
        rowBuilder.link.appendTo($('tr:last td:last'));
    },

    // Public method for hiding the data entry fields.
    hideForm: function() {
        $(cfg.formId).modal('hide');
    }
};

// Provides functionality for building the HTML that represents a new <TR> for the Battalions table.
var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this Battalion.'
    }).append($('<i>', { class: 'icon-remove' }));

    // A private method for building a <TR> w/the required data.
    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            console.log(this.tableId);
            $(this).removeAttr('class');
        //    return $('<td/>').append($(this));
            var td = $('<td/>').append($(this));
            console.log(td);
            td.appendTo(newRow);
        });//.appendTo(newRow);

        return newRow;
    };

    // A public method for building a row and attaching it to the end of a <TBODY> element.
    var attachRow = function(tableBody, fields) {
        console.log('called attachRow');
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    };

    // Only expose public methods/properties.
    return {
        addRow: attachRow,
        link: link
    }
}();
