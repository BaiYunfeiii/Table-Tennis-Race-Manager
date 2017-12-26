var operation = function(cellValue, options, rowObject){
    return '<a class="btn btn-link" onclick="save('+cellValue+')">报名</a>'
}

var genderFormatter = function(cellValue, options, rowObject){
    if(cellValue < 0){
        return '不限';
    }
    if(cellValue == 0){
        return '男';
    }
    if(cellValue == 1){
        return '女';
    }
}

function save(id){
    var url = 'enroll/userEnroll';
    var data = {'id':id};
    $.ajax({
        type: "POST",
        url: baseURL + url,
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (r) {
            if (r.code === 0) {
                alert('报名成功', function (index) {
                    vm.reload();
                });
            } else {
                alert(r.msg);
            }
        }
    });
}

$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'enroll/enrollableRaceList',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'r.id', key: true, width:30 },
			{ label: '比赛名称', name: 'name', index: 'r.name'},
			{ label: '开始时间', name: 'startTime', index: 'r.start_time'},
			{ label: '结束时间', name: 'endTime', index: 'r.end_time'},
			{ label: '活动地点', name: 'place', index: 'r.place'},
            { label: '截止时间', name: 'enrollDeadline', index:'r.enrollDeadline'},
			{ label: '性别限制', name : 'gender',index:'r.gender', formatter:genderFormatter},
			{ label: '操作', name : 'id', formatter:operation}
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
		race: {},
		categories:[
			{name:'乒乓球',id:'1'},
			{name:'篮球',id:'2'}
		]
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.race = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.race.id == null ? "race/save" : "race/update";
            var data = $('#itemForm').serializeObject();
            data.id = vm.race.id;
			$.ajax({
				type: "POST",
				url: baseURL + url,
				contentType: "application/json",
				data: JSON.stringify(data),
				success: function (r) {
					if (r.code === 0) {
						alert('操作成功', function (index) {
							vm.reload();
						});
					} else {
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "race/delete",
				    contentType: "application/json",
				    data: JSON.stringify(ids),
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
		getInfo: function(id){
			$.get(baseURL + "race/info/"+id, function(r){
                vm.race = r.race;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
		renderDatapicker: function(){
			// $("#startTime").datetimepicker();
			// $("#startTime").datetimepicker().on('hide',function(ev){
			// 	console.log(ev);
			// 	this.race.startTime = $("#startTime").val();
			// });
			// $("#endTime").datetimepicker().on('hide', function(ev){
			// 	this.race.endTime = $("#startTime").val();
			// });
		}
	},
	mounted: function(){
		this.renderDatapicker();
	}
});

layui.use(['laydate','form','layer']);

var renderDatePicker = function (element){
	layui.laydate({
		elem:element,
		istime:true,
		format:'YYYY-MM-DD hh:mm:ss'
	})
};

tinymce.init({
    selector : '#detailArea',
	plugins : 'image paste',
	images_upload_url : 'common/imageUpload',
    images_upload_credentials: true,
	height: 350
});