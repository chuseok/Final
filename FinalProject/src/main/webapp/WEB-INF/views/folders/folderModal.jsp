<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Modal -->
	<div class="modal fade" id="folderModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times</button>
					<h4 class="modal-title" id="myModalLabel">FOLDER</h4>
				</div>
				<div class="modal-body">
					
					<div class="form-group">
                <label>Folder Title</label> <input class="form-control" name='folderTitle'
							value='New Folder!!!!'>
					</div>
					<div class="form-group">
						<label>Description</label> <input class="form-control" name='description'
							value='description'>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id='modalRegisterBtn' class="btn btn-default">Resister</button>
					<button type="button" id='modalCloseBtn' class="btn btn-default"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
</body>
</html>