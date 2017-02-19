/**
 * 
 * @author mark.li
 * @since 2008.8.28
 */
//简单树查询|简单树节点定位
var SimpleTreeQuery = {
    /**
     * 初始化
     */
    init: function(){
        var tree = TreeQuery2ViewModel.getControl("treeEmployee");
        //将展开与收缩的树节点进行缓存
        CacheNodeByState.init(tree);
        //根据节点路径进行缓存
        CacheNodeByPath.init(tree);
    },
    /**
     * 收缩所有的节点
     */
    collapseAllNodes: function(){
        var tree = TreeQuery2ViewModel.getControl("treeEmployee");
        CacheNodeByState.collapseAllNodes(tree);
    },
    /**
     * 是否仅显示一个节点的路径
     */
    showOnlyOnePath: false,
    /**
     * 在treeEmployee中定位与datasetEmployee的当前记录信息相同的树节点
     * @param {Record} employee   员工记录
     * @param {Boolean} isCurrent 是否要将定位的节点设置为当前节点
     */
    query: function(employee,isCurrent){
        if (employee) {
            var nodePath = CacheNodeByPath._getEmployeeNodePath_byRecord(employee);
            if (parseBoolean(this.showOnlyOnePath)) {
                this.collapseAllNodes();
            }
            this.setCurrentEmployeeNodeByPath(nodePath,isCurrent);
        }
    },
	/**
	 * 加载部门节点下的所有员工节点
	 * @param {Tree} tree 组织机构树
	 * @param {Dataset} datasetNode 存放员工新的Dataset
	 */
	loadDeptEmployees:function(tree,datasetNode){
		datasetNode.parameters().clear();
		datasetNode.parameters().setValue("dept_id",tree.getCurrentNode()._orgID);
		datasetNode.flushDataAsync(
		  function(){
		  	SimpleTreeQuery.loadDeptEmployees_callback(tree, datasetNode);
		  }
		);
	},
	loadDeptEmployees_callback:function(tree,datasetNode){
		for(var employee=datasetNode.getFirstRecord(); employee;){
		    var nodePath = CacheNodeByPath._getEmployeeNodePath_byRecord(employee);
			SimpleTreeQuery.setCurrentEmployeeNodeByPath(nodePath,false);
			employee = employee.getNextRecord();
	    }
	},
    /**
     * 根据节点路径设置CurrentNode,
     * nodePath的格式见CacheNodeByPath._nodePathTemplate
     * @param {String} nodePath 树节点路径
     * @param {Boolean} [isCurrent=true] 是否要将定位的节点设置为当前节点
     */
    setCurrentEmployeeNodeByPath: function(nodePath,isCurrent){ 
		isCurrent = (typeof(isCurrent)=='undefined')?true:isCurrent;
        var pathArray = nodePath.split('|');
        var branchId = pathArray[0];
        var branchName = pathArray[1];
        var deptId = pathArray[2];
        var deptName = pathArray[3];
        var employeeId = pathArray[4];
        var employeeName = pathArray[5];
        
        
        var tree = TreeQuery2ViewModel.getControl("treeEmployee");
        var rootNode = tree.getFirstRootNode();
        var branchNode = this.getBranchNode(rootNode, branchId, branchName);
        var deptNode = this.getDeptNode(branchNode, deptId, deptName);
        var employeeNode = this.getEmployeeNode(deptNode, employeeId, employeeName, false);
        
        tree.expandNode(rootNode);
        tree.expandNode(branchNode);
        tree.expandNode(deptNode);
		
		if(parseBoolean(isCurrent)){
			tree.setCurrentNode(employeeNode);
		}
    },
    getBranchNode: function(rootNode, branchId, branchName){
        return CacheNodeByPath.getChild.apply(CacheNodeByPath, arguments);
    },
    getDeptNode: function(branchNode, deptId, deptName){
        return CacheNodeByPath.getChild.apply(CacheNodeByPath, arguments);
    },
    getEmployeeNode: function(deptNode, employeeId, employeeName, hasChild){
        return CacheNodeByPath.getChild.apply(CacheNodeByPath, arguments);
    }
};

//通过树节点的状态（展开|收缩）将其缓存
var CacheNodeByState = {
    //初始化
    init: function(tree){
        tree._expandNodeCache = new HashList();
        tree._expandNode = tree.expandNode;
        tree.expandNode = function(node){
            this._expandNode(node);
            var code = CacheNodeByState._getHashCode(node);
            if (!this._expandNodeCache.get(code)) {
                this._expandNodeCache.put(code, node);
            }
        };
        tree._collapseNode = tree.collapseNode;
        tree.collapseNode = function(node){
            this._collapseNode(node);
            var code = CacheNodeByState._getHashCode(node);
            this._expandNodeCache.remove(code);
        }
    },
    /**
     * 收缩所有的树节点
     * @param {Tree} tree
     */
    collapseAllNodes: function(tree){
        var nodeNodeArray = tree._expandNodeCache;
        for (var node = nodeNodeArray.get(0); node;) {
            tree.collapseNode(node);
            node = nodeNodeArray.get(0);
        }
    },
    _getHashCode: function(node){
        return "$" + node._hashCode;
    }
};

//根据节点路径进行缓存
var CacheNodeByPath = {
    init: function(tree){
        tree._nodePathCache = new HashList();
    },
    getCacheNode: function(tree, nodePath){
        return tree._nodePathCache.get(nodePath);
    },
    getChild: function(parentNode, id, name, hasChild){
        var nodePath = CacheNodeByPath._getEmployeeNodePath_byNode(parentNode, id, name);
        var resultNode = CacheNodeByPath.getCacheNode(parentNode.getTree(), nodePath);
        if (resultNode) {
            return resultNode;
        }
        else {
            var nodeCollection = parentNode.getNodes();
            var tempNode = nodeCollection.getFirst();
            while (tempNode) {
                if (tempNode._orgID == id) {
                    resultNode = tempNode;
                    break;
                }
                tempNode = tempNode.getNext();
            }
            if (!resultNode) {
                var resultNode = new DefaultTreeNode(name);
                resultNode.setHasChild(parseBoolean(hasChild));
                resultNode._orgID = id;
                parentNode.getTree()._nodePathCache.put(nodePath, resultNode);
                parentNode.addNode(resultNode);
            }
            return resultNode;
        }
    },
    _nodePathTemplate: "branchId|branchName|deptId|deptName|employeeId|employeeName",
    _getEmployeeNodePath_byRecord: function(employee){
        var nodePath = employee._nodePath;
        if (!nodePath) {
            nodePath = CacheNodeByPath._nodePathTemplate;
            nodePath = nodePath.replace("branchId", employee.getValue("branch_id")).replace("branchName", employee.getValue("branch_name")).replace("deptId", employee.getValue("dept_id")).replace("deptName", employee.getValue("dept_name")).replace("employeeId", employee.getValue("employee_id")).replace("employeeName", employee.getValue("employee_name"));
            employee._nodePath = nodePath;
        }
        return nodePath;
    },
    _getEmployeeNodePath_byNode: function(parentNode, id, name){
        var nodePath = id + "|" + name;
        var parentNodePath = parentNode._nodePath;
        return parentNodePath ? parentNodePath + nodePath : nodePath;
    }
}

//菜单行为管理器
var MenuManager = {
	//控制menu的显示方式
    changeFace: function(tree, node, menu){
        var menu = TreeQuery2ViewModel.getControl("menuTree");
        switch (node.getLevel()) {
            case 1://root
                menu.setPopupContainer();
                break;
            case 2://分公司
                menu.setPopupContainer();
                break;
            case 3://部门
                menu.setPopupContainer(TreeQuery2ViewModel.getControl("treeEmployee").getId());
				var label="显示所有【dept】员工".replace("dept",node.getLabel());
				menu.getTopItem().getItem("showDeptEmployee").setLabel(label);
                break;
            case 4://员工
                menu.setPopupContainer();
                break;
        }
    },
	bizController:function(menu, item, tree){
		switch (item.getName()){
			case "showDeptEmployee":
				SimpleTreeQuery.loadDeptEmployees(TreeQuery2ViewModel.getControl("treeEmployee"),TreeQuery2ViewModel.getDataset("datasetEmployee_tree"));
				break;
		}
	}
}
