"use strict";

function initUI() {
    $('.selectpicker').selectpicker()
}

function popoverHide() {
    $('.popover').popover('hide')
}

function popoverTemplate() {
    return '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div><div class="mask-popover"></div>'
}


$( document ).ready( function () {
    $('#tabNew').on('hidden.bs.modal', function ( event ) {
        $( this ).find('input').val('').end()
                 .find('select').selectpicker('val', '');
    });
});