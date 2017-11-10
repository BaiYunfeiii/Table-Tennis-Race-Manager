$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/generator/list',
        datatype: "json",
        colModel: [			
			{ label: '表名', name: 'tableName', width: 100, key: true },
			{ label: 'Engine', name: 'engine', width: 70},
			{ label: '表备注', name: 'tableComment', width: 100 },
			{ label: '创建时间', name: 'createTime', width: 100 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50,100,200],
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
		q:{
			tableName: null
		},
        moduleName:'',
        packageName:'',
        prefixName:''
	},
	methods: {
		query: function () {
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'tableName': vm.q.tableName},
                page:1 
            }).trigger("reloadGrid");
		},
		generator: function() {
            layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "代码生成",
                area: ['550px', '270px'],
                shadeClose: false,
                content: jQuery("#genLayer"),
                btn: ['生成','取消'],
                btn1: function (index) {
                    var tableNames = getSelectedRows();
                    if(tableNames == null){
                        return ;
                    }
                    location.href = baseURL + "sys/generator/code?tables=" + JSON.stringify(tableNames) +"&packageName="+vm.packageName+"&moduleName="+vm.moduleName+"&prefix="+vm.prefixName;
                }
            });
		}
	}
});

