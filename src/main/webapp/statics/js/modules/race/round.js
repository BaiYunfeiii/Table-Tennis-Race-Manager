$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'round/list',
        datatype: "json",
        colModel: [			
			{ label: 'roundId', name: 'roundId', index: 'round_id', width: 50, key: true },
			{ label: '主场', name: 'hostId', index: 'host_id', width: 80 }, 			
			{ label: '客场', name: 'guestId', index: 'guest_id', width: 80 }, 			
			{ label: '主场得分', name: 'hostPoint', index: 'host_point', width: 80 }, 			
			{ label: '客场得分', name: 'guestPoint', index: 'guest_point', width: 80 }, 			
			{ label: '场次', name: 'competitionId', index: 'competition_id', width: 80 }, 			
			{ label: '小局顺序', name: 'order', index: 'order', width: 80 }			
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
		round: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.round = {};
		},
		update: function (event) {
			var roundId = getSelectedRow();
			if(roundId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(roundId)
		},
		saveOrUpdate: function (event) {
			var url = vm.round.roundId == null ? "round/save" : "round/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.round),
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
			var roundIds = getSelectedRows();
			if(roundIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "round/delete",
				    contentType: "application/json",
				    data: JSON.stringify(roundIds),
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
		getInfo: function(roundId){
			$.get(baseURL + "round/info/"+roundId, function(r){
                vm.round = r.round;
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