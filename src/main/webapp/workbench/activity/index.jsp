<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bs_pagination/jquery.bs_pagination.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="jquery/bs_pagination/en.js"></script>

<script type="text/javascript">

	$(function(){
		$("#createActive").click(function () {
			$.ajax({
				url:"workbench/active/create.do",
				type:"GET",
				dataType:"json",
				success:function (data) {
					$("#create-marketActivityOwner").empty();
					$.each(data,function (index,element) {
						$("#create-marketActivityOwner").append("<option value='"+element.id+"'>"+element.name+"</option>");
					})
					let id = "${user.id}";
					$("#create-marketActivityOwner").val(id);
				}
			});

			$("#saveBtn").click(function () {
				$.ajax({
					url:"workbench/active/save.do",
					type:"POST",
					data:{
						owner:$.trim($("#create-marketActivityOwner").val()),
						name:$.trim($("#create-marketActivityName").val()),
						startDate:$.trim($("#create-startTime").val()),
						endDate:$.trim($("#create-endTime").val()),
						cost:$.trim($("#create-cost").val()),
						description:$.trim($("#create-describe").val())
					},
					dataType: "json",
					success:function (data) {
						if (data.succeed) {
							$("#create-form")[0].reset();
							$("#createActivityModal").modal("hide");//show 展示 hide 隐藏
							pageList(1,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
						}else {
							alert("添加失败");
						}
					}
				})
			})
		});

		$(".time").datetimepicker({
			minValue:"month",
			language:"zh-CN",
			format:"yyyy-mm-dd",
			autoclose:true,
			todayBtn:true,
			pickerPosition:"bottom-left"
		});

		$("#selectBtn").click(function () {
			$("#hide-name").val($("#select-name").val());
			$("#hide-owner").val($("#select-owner").val());
			$("#hide-startDate").val($("#select-startDate").val());
			$("#hide-endDate").val($("#select-endDate").val());
			pageList(1,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
		});
		pageList(1,3);

		$("#checkboxs").click(function () {
			$("input[name=radios]").prop("checked",this.checked);
			isClick();
		});

		/*
		* 动态生成的元素需要以on方法的形式来触发事件
		*
		* 语法：
		* 	$(需要绑定元素的有效外层元素).on(需要绑定的事件,需要绑定事件的jquery对象,回调函数)
		* */
		$("#select-pageActive").on("click",$("input[name=radios]"),function () {
			$("#checkboxs").prop("checked",$("input[name=radios]").length === $("input[name=radios]:checked").length);
			isClick();
		});

		/*
		* 加载需要更新的活动
		* */
		$("#updateActive").click(function () {
			let $checked = $("input[name=radios]:checked");
			let id = $checked.val();
			// alert($checked.val());
			$.ajax({
				url:"workbench/active/selectInfo.do",
				type:"get",
				data:{
					id: id
				},
				dataType:"json",
				success:function (data) {
					/*
					* data={userList:[{所有者1}，{所有者2}，{所有者3}],activity:活动对象}
					* */
					$("#edit-marketActivityOwner").empty();
					$.each(data.userList,function (index,element) {
						$("#edit-owner").append("<option value='"+element.id+"'>"+element.name+"</option>");
					});
					$("#edit-id").val(data.activity.id);
					$("#edit-owner").val(data.activity.owner);
					$("#edit-name").val(data.activity.name);
					$("#edit-startDate").val(data.activity.startDate);
					$("#edit-endDate").val(data.activity.endDate);
					$("#edit-cost").val(data.activity.cost);
					$("#edit-description").val(data.activity.description);
				}
			});

			/*
			* 发送更新请求到后台
			* */
			$("#updateBtn").click(function () {
				$.ajax({
					url:"workbench/active/update.do",
					type:"POST",
					data:{
						id:$("#edit-id").val(),
						owner:$.trim($("#edit-owner").val()),
						name:$.trim($("#edit-name").val()),
						startDate:$.trim($("#edit-startDate").val()),
						endDate:$.trim($("#edit-endDate").val()),
						cost:$.trim($("#edit-cost").val()),
						description:$.trim($("#edit-description").val())
					},
					dataType: "json",
					success:function (data) {
						if (data.succeed) {
							$("#editActivityModal").modal("hide");//show 展示 hide 隐藏
							pageList($("#activityPage").bs_pagination('getOption', 'currentPage')
									,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
						} else {
							alert("添加失败");
						}
					}
				})
			});
		});

		$("#deleteActive").click(function () {
			let $checkeds = $("input[name=radios]:checked");
			if (confirm("是否要删除选中的记录")) {
				let param = "";
				for (let i = 0;i < $checkeds.length;i++) {
					param += "id=" + $($checkeds[i]).val();
					if (i< $checkeds.length-1) param+="&";
				}
				$.ajax({
					url:"workbench/active/delete.do",
					type:"post",
					data: param,
					dataType:"json",
					success:function (data) {
						/*
                        data={suceed:boolean}
                         */
						if (data.succeed) {
							pageList(1,$("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
						} else {
							alert("删除失败！");
						}
					}
				})
			}
		})

	});

	function isClick() {
		let $checkeds = $("input[name=radios]:checked");
		if ($checkeds.length === 0) {
			$("#updateActive").prop("disabled",true);
			$("#deleteActive").prop("disabled",true);
		} else if ($checkeds.length === 1) {
			$("#updateActive").prop("disabled",false);
			$("#deleteActive").prop("disabled",false);
		} else {
			$("#updateActive").prop("disabled",true);
			$("#deleteActive").prop("disabled",false);
		}
	}

	function pageList(pageNo,pageSize) {
		$("#select-name").val($("#hide-name").val());
		$("#select-owner").val($("#hide-owner").val());
		$("#select-startDate").val($("#hide-startDate").val());
		$("#select-endDate").val($("#hide-endDate").val());
		$.ajax({
			url:"workbench/active/select.do",
			type:"GET",
			data:{
				name: $.trim($("#select-name").val()),
				owner: $.trim($("#select-owner").val()),
				startDate: $.trim($("#select-startDate").val()),
				endDate: $.trim($("#select-endDate").val()),
				pageNo: pageNo,
				pageSize: pageSize
			},
			dataType:"json",
			success:function (data) {
				let html = '';
				$.each(data.activity,function (index,element) {
					html += '<tr class="active">';
					html += '<td><input type="checkbox" name="radios" value="'+element.id+'" /></td>';
					html += '<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href=\'workbench/active/detail.do?id='+element.id+'\';">'+element.name+'</a></td>';
					html += '<td>'+element.owner+'</td>';
					html += '<td>'+element.startDate+'</td>';
					html += '<td>'+element.endDate+'</td>';
					html += '</tr>';
				});
				$("#select-pageActive").html(html);
				//计算总页数
				let totalPages = data.total%pageSize===0?data.total/pageSize:parseInt(data.total/pageSize)+1;
				//数据处理完毕后，结合分页查询，对前端展现分页信息
				$("#activityPage").bs_pagination({
					currentPage: pageNo, // 页码
					rowsPerPage: pageSize, // 每页显示的记录条数
					maxRowsPerPage: 20, // 每页最多显示的记录条数
					totalPages: totalPages, // 总页数
					totalRows: data.total, // 总记录条数

					visiblePageLinks: 3, // 显示几个卡片

					showGoToPage: true,
					showRowsPerPage: true,
					showRowsInfo: true,
					showRowsDefaultInfo: true,

					//该回调函数时在，点击分页组件的时候触发的
					onChangePage : function(event, data){
						pageList(data.currentPage , data.rowsPerPage);
					}
				});
			}
		})
	}
</script>
</head>
<body>
	<input type="hidden" id="hide-name">
	<input type="hidden" id="hide-owner">
	<input type="hidden" id="hide-startDate">
	<input type="hidden" id="hide-endDate">
	<!-- 创建市场活动的模态窗口 -->
	<div class="modal fade" id="createActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form id="create-form" class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-marketActivityOwner"></select>
							</div>
                            <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-marketActivityName">
                            </div>
						</div>
						<div class="form-group">
							<label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control time" id="create-startTime">
							</div>
							<label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control time" id="create-endTime">
							</div>
						</div>
                        <div class="form-group">
                            <label for="create-cost" class="col-sm-2 control-label">成本</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-cost">
                            </div>
                        </div>
						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-describe"></textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="saveBtn" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改市场活动的模态窗口 -->
	<div class="modal fade" id="editActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<input type="hidden" id="edit-id">
						<div class="form-group">
							<label for="edit-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-owner"></select>
							</div>
                            <label for="edit-name" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-name" value="发传单">
                            </div>
						</div>
						<div class="form-group">
							<label for="edit-startDate" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-startDate">
							</div>
							<label for="edit-endDate" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-endDate">
							</div>
						</div>
						<div class="form-group">
							<label for="edit-cost" class="col-sm-2 control-label">成本</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-cost">
							</div>
						</div>
						<div class="form-group">
							<label for="edit-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-description"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="updateBtn" type="button" class="btn btn-primary">更新</button>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>市场活动列表</h3>
			</div>
		</div>
	</div>
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input id="select-name" class="form-control" type="text">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input id="select-owner" class="form-control" type="text">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">开始日期</div>
					  <input class="form-control time" type="text" id="startTime" />
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">结束日期</div>
					  <input class="form-control time" type="text" id="endTime">
				    </div>
				  </div>
				  <button id="selectBtn" type="button" class="btn btn-default">查询</button>
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button id="createActive" type="button" class="btn btn-primary" data-toggle="modal" data-target="#createActivityModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button id="updateActive" type="button" disabled class="btn btn-default" data-toggle="modal" data-target="#editActivityModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button id="deleteActive" type="button" disabled class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkboxs" /></td>
							<td>名称</td>
                            <td>所有者</td>
							<td>开始日期</td>
							<td>结束日期</td>
						</tr>
					</thead>
					<tbody id="select-pageActive"></tbody>
				</table>
			</div>
			<div style="height: 50px; position: relative;top: 30px;">
				<div id="activityPage"></div>
			</div>
		</div>
	</div>
</body>
</html>