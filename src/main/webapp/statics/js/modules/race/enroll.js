$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'enroll/enrolledList',
        datatype: "json",
        colModel: [			
			{ label: '报名号', name: 'enrollId', index: 'enrollId',key: true },
			{ label: '比赛名称', name: 'race.name', index: 'race.name'},
			{ label: '类型', name: 'race.category.name', index: 'race.category.name'},
			{ label: '开始时间', name: 'race.startTime', index: 'startTime'},
			{ label: '地点', name: 'race.place', index: 'place'},
			{ label: '报名时间', name: 'enrollTime', index: 'enroll_time'}			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		enroll: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.enroll = {};
		},
		update: function (event) {
			var enrollId = getSelectedRow();
			if(enrollId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(enrollId)
		},
		saveOrUpdate: function (event) {
			var url = vm.enroll.enrollId == null ? "enroll/save" : "enroll/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.enroll),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var enrollIds = getSelectedRows();
			if(enrollIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "enroll/delete",
				    contentType: "application/json",
				    data: JSON.stringify(enrollIds),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(enrollId){
			$.get(baseURL + "enroll/info/"+enrollId, function(r){
                vm.enroll = r.enroll;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});