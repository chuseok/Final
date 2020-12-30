console.log("Folder Module......");

var folderService = (function() {
	var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");

	function add(folder, callback, error) {
		console.log("folder add..........");

		console.log(csrfHeaderName);
		$.ajax({
			type : 'post',
			url : '/folders/new',
			data : JSON.stringify(folder),
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				    alert ( "code :"+ xhr.status + "\ n"+ "message :"+ xhr.responseText + "\ n"+ "error :"+ er);

				}
			}
		});
	}

	function send(mail, callback, error) {
		console.log("mail..........");

		$.ajax({
			type : 'post',
			url : '/mail',
			data : JSON.stringify(mail),
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(folderId, callback, error) {

		$.ajax({
			type : 'delete',
			url : '/folders/' + folderId,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	return {
		add : add,
		send : send,
		remove : remove
	};
})();
