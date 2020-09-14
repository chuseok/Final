console.log("WordBook Module......");

var wordBookService = (function() {
	var csrfTokenValue = $("meta[name='_csrf']").attr("content");
	var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	
	console.log('csrfHeaderName:' + csrfHeaderName);
	function add(wordBook, callback, error) {
		console.log("wordBook..........");
		
		$.ajax({
			type : 'post',
			url : '/wordbooks/new',
			data : JSON.stringify(wordBook),
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error) {
		var folderId = param.folderId;
		var page = param.page || 1;
		var userId = param.userId;
		
		$.getJSON("/wordbooks/pages/" + folderId + "/" + page + "/" + userId + ".json",
				function(data) {
			if(callback) {
				callback(data);
			}
			}).fail(function(xhr, status,err) {
				if(error) {
					error();
				}
			});
	}//단어장 목록
	
	function getYourSet(userId, callback, error) {
		$.getJSON("/wordbooks/add/user/" + userId + ".json",
				function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	function remove(bookId, callback, error){
		
		$.ajax({
			type : 'delete',
			url : '/wordbooks/' + bookId,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}				
		});
	}
	
	function update(wordBook, callback, error){
		console.log("bookId: " + wordBook.bookId);
		
		$.ajax({
			type : 'put',
			url : '/wordbooks/' + wordBook.bookId,
			data : JSON.stringify(wordBook),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}				
		});
	}
	
	function updateFromFolder(wordBook, callback, error) {
		console.log("bookId: " + wordBook.bookId);
		
		$.ajax({
			type : 'put',
			url : '/wordbooks/modify/wordBook/' + wordBook.bookId,
			data : JSON.stringify(wordBook),
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function get(bookId, callback, error) {
		$.get("/wordbooks/" + bookId + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}

	return {
		add:add,
		getList:getList,
		remove:remove,
		get:get,
		getYourSet:getYourSet,
		updateFromFolder:updateFromFolder
	};
})();
