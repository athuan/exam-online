/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2009 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 212 2009-09-03 05:33:44Z emartin24 $
 *
 */

$(document).ready(function () {
	$('#basic-modal input.basic, #basic-modal a.basic').click(function (e) {
		e.preventDefault();
		$('#basic-modal-content').modal();
	});

	$('#basic-modal a.basicDelete').click(function (e) {
		e.preventDefault();
		if(confirm('Do you want to delete this record')){
				doSubmit();
		}
	});
	
	$('#basic-modal1 a.basicDelete').click(function (e) {
		
		if(confirm('Do you want to delete this record')){
				doSubmit();
		}
	});
});