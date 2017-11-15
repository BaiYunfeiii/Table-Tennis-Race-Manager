var raceStatusFormatter = function(cellValue, options, rowObject){
    if(cellValue === 1){
        return '<span class="label label-info">未开始</span>';
    }else if (cellValue === 2){
        return '<span class="label label-success">进行中</span>';
    }else if (cellValue === 3){
        return '<span class="label">已结束</span>';
    }
    return '<span class="label">未知</span>'
}

function initStageTable() {
    $("#jqGrid-stage").jqGrid({
        url: baseURL + 'stage/list',
        postData:{
            raceId : vm.race.id
        },
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 's.id', width: 50},
            { label: '轮次名称', name: 'name', index: 's.name'},
            { label: '顺序', name: 'order', index: 's.order'},
            { label: '所属比赛', name: 'race.name', index: 'r.name' },
            { label: '轮次状态', name: 'status', index: 's.status', formatter: raceStatusFormatter}
        ],
        viewrecords: true,
        height: 200,
        rowNum: 3,
        rowList : [3,5,10,20],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager-stage",
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
}

var vm = new Vue({
    el:'#rrapp',
    data:{
        showList: true,
        title: null,
        race: {},
        stage: {}
    },
    methods: {
        loadRace: function(){
            var url = baseURL + "race/info/"+$.getUrlParam("raceId");
            $.ajax({
                type: "GET",
                url: baseURL + url,
                success: function(r){
                    if(r.code === 0){
                        vm.race = r.race;
                        initStageTable();
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        query: function () {
            vm.reload();
        },
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.stage = {};
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
            var url = vm.stage.id == null ? "stage/save" : "stage/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.stage),
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
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "stage/delete",
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
            $.get(baseURL + "stage/info/"+id, function(r){
                vm.stage = r.stage;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        }
    },
    created:function(){
        this.loadRace();
    }
});