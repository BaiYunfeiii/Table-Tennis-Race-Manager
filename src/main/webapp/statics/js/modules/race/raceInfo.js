var raceStatusFormatter = function(cellValue, options, rowObject){
    if(cellValue === 1){
        return '<span class="label label-info">未开始</span>';
    }else if (cellValue === 2){
        return '<span class="label label-success">进行中</span>';
    }else if (cellValue === 3){
        return '<span class="label label-success">已结束</span>';
    }
    return '<span class="label">未知</span>'
}

var typeFormatter = function(cellValue){
    var type = '';
    if(cellValue == 1){
        type = '淘汰赛';
    }else if(cellValue ==2 ){
        type = '循环赛';
    }else if(cellValue == 3){
        type = '小组循环赛';
    }
    return type;
}

var stageOperation = function(cell, options, rawObject){
    var operation = '';
    if(rawObject.status == 1 ){
        operation += '<a href="javascript:startStage('+rawObject.id+');" >开始</a>&nbsp;';
    }
        operation += '<a href="javascript:enterStage('+rawObject.id+');" >进入</a>&nbsp;';
    if(rawObject.status == 2){
        operation += '<a href="javascript:statistic('+rawObject.id+');" >统计结果</a>&nbsp;';
    }
    if(rawObject.status == 3){
        operation += '<a href="javascript:showPlayers('+rawObject.id+',\'比赛成绩\');" >查看结果</a>'
    }
    return operation;
}

function startStage(stage_id){
    $.ajax({
        method: "POST",
        contentType: "application/json",
        url: baseURL + 'stage/start',
        data:JSON.stringify({id:stage_id}),
        success: function(r){
            if(r.code === 0){
                vm.loadRoundsInfo(vm.currentStage);
            }else{
                alert(r.msg);
            }
        }
    });
}

function statistic(stage_id){
    $.ajax({
        method: "POST",
        contentType: "application/json",
        url: baseURL + 'stage/finish',
        data:JSON.stringify({id:stage_id}),
        success: function(r){
            if(r.code === 0){
                alert("成绩统计完成");
                initStageTable();
            }else{
                alert(r.msg);
            }
        }
    });
}

function enterStage(stage_id){
    $("#collapseCompetition").collapse('show');
    vm.currentStage = stage_id
    vm.loadRoundsInfo(stage_id);
}

function addRound(box){
    var c = vm.getCompetition(box.childNodes["0"].data);
    vm.newRound = {
        competitionId: c.id,
        hostId : c.host.id,
        hostName: c.host.name,
        guestId : c.guest.id,
        guestName : c.guest.name,
        hostPoint:0,
        guestPoint:0
    }
    layer.open({
        type:1,
        content: $('#round-form'),
        btn:['添加'],
        yes:function(index, layero){
            $.ajax({
                type: "POST",
                url: baseURL + 'round/save',
                contentType: "application/json",
                data: JSON.stringify(vm.newRound),
                success: function(r){
                    if(r.code === 0){
                        vm.loadRoundsInfo(vm.currentStage);
                        layer.close(index);
                    }else{
                        alert(r.msg);
                    }
                }
            });
        }
    })
}


function initCompetitionTable(stage_id) {
    var url = "competition/listByStage";
    $.ajax({
        type: "POST",
        url: baseURL + url,
        contentType: "application/json",
        data: JSON.stringify({id:stage_id}),
        success: function(r){
            if(r.code === 0){
                alert('操作成功');
            }else{
                alert(r.msg);
            }
        }
    });
}

function showPlayers(stage_id,title){
    layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['893px', '600px'],
        content: baseURL + 'modules/race/stage_player.html?stageId='+stage_id
    });
}

function initStageTable() {
    $("#jqGrid-stage").jqGrid({
        url: baseURL + 'stage/list',
        postData:{
            'raceId' : vm.currentRace.id
        },
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 's.id', width: 50},
            { label: '轮次名称', name: 'name', index: 's.name', width:60},
            { label: '顺序', name: 'order', index: 's.order', width: 50},
            { label: '所属比赛', name: 'race.name', index: 'r.name' },
            { label: '轮次状态', name: 'status', index: 's.status', formatter: raceStatusFormatter, width:60},
            { label: '赛制', name: 'type', index:'s.type', formatter: typeFormatter, width:60},
            { label: '运动员名单', name: '', index:'', formatter: function(cell, options, rawObject){
                return '<a href="javascript:showPlayers('+rawObject.id+',\'比赛成绩\');" >查看名单</a>';
            }},
            { label: '操作', name: 'id', formatter: stageOperation}
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
        currentRace: {},
        race: {},
        stage: {},
        currentStage: null,
        selectableRaceList: [],
        competitions: [],
        newRound: {host:{}, guest:{}}
    },
    methods: {
        loadRace: function(){
            var url = "race/info/"+$.getUrlParam("raceId");
            $.ajax({
                type: "GET",
                url: baseURL + url,
                success: function(r){
                    if(r.code === 0){
                        vm.currentRace = r.race;
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
            vm.loadSelectableRace();
        },
        update: function (event) {
            var id = getSelectedRow("jqGrid-stage");
            if(id == null){
                return ;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id);
            vm.loadSelectableRace();
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
            var ids = getSelectedRow("jqGrid-stage");
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
            var page = $("#jqGrid-stage").jqGrid('getGridParam','page');
            $("#jqGrid-stage").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        },
        loadSelectableRace: function(){
            $.get(baseURL + "race/listUnstarted", function(data, status){
                if(data.list.length != undefined){
                    vm.selectableRaceList = data.list;
                    vm.stage.raceId = vm.currentRace.id;
                }
            });
        },
        loadRoundsInfo: function(id){
            $.get(baseURL + "competition/infoWithRound/"+id, function(data, status){
                if(data.competitions != undefined){
                    vm.competitions = [];
                    for(var i=0;i<data.competitions.length;i++){
                        vm.competitions.push(data.competitions[i]);
                    }
                }
            });
        },
        getCompetition: function(competitionId){
            for(var i=0;i < vm.competitions.length;i++){
                if(vm.competitions[i].id == competitionId){
                    return vm.competitions[i];
                }
                return undefined;
            }
        },
        addRound: function(competition, roundId){
            var c = competition;
            vm.newRound = {
                competitionId: c.id,
                hostId : c.host.id,
                hostName: c.host.name,
                guestId : c.guest.id,
                guestName : c.guest.name,
                hostPoint:0,
                guestPoint:0
            }
            if(roundId != undefined){
                vm.newRound.roundId = roundId;
            }
            layer.open({
                type:1,
                content: $('#round-form'),
                btn:['添加'],
                yes:function(index, layero){
                    $.ajax({
                        type: "POST",
                        url: baseURL + 'round/save',
                        contentType: "application/json",
                        data: JSON.stringify(vm.newRound),
                        success: function(r){
                            if(r.code === 0){
                                vm.loadRoundsInfo(vm.currentStage);
                                layer.close(index);
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                }
            })
        },
        arrange: function(stageId){
            $.ajax({
                method: "POST",
                contentType: "application/json",
                url: baseURL + 'competition/arrange',
                data:JSON.stringify({id:stageId}),
                success: function(r){
                    if(r.code === 0){
                        vm.loadRoundsInfo(vm.currentStage);
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        finishCompetition: function(c){
            $.ajax({
                method: "POST",
                contentType: "application/json",
                url: baseURL + 'competition/finish',
                data:JSON.stringify({id:c.id}),
                success: function(r){
                    if(r.code === 0){
                        vm.loadRoundsInfo(vm.currentStage);
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        showAllPlayers: function(type){
            layer.open({
                type: 2,
                title: '所有运动员',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['893px', '600px'],
                content: baseURL + 'modules/race/all_player.html?raceId='+vm.currentRace.id+"&type="+type
            });
        }
    },
    created:function(){
        this.loadRace();
    },
});