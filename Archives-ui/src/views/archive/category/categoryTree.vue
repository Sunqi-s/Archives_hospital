<template>
  <div class="file-style">
    <!-- 搜索输入框 -->
    <!-- <el-input
      v-model="searchText"
      placeholder="请输入搜索内容"
      clearable
      size="small"
      prefix-icon="el-icon-search"
      @input="debounceFilterTree"
    ></el-input> -->
    <!-- 树形结构 -->
    <el-tree
      v-if="fileOptions"
      :data="fileOptions"
      :props="fileProps"
      @node-click="handleNodeClick"
      :node-key="'id'"
      @check-change="handleCheckChange"
      :default-expand-all="defaultExpandAll"
      :filter-node-method="fileNode"
      :show-checkbox="show"
      ref="tree"
    >
      <span class="custom-tree-node" slot-scope="{ node, data }">
        <span >
          <i class="el-icon-document" v-if="data.parentId!==0"></i>
          <i class="el-icon-folder" v-else></i>
          <span :style="clickNode === data.id && data.parentId>0? 'color:#409eff':''">{{ data.label }}</span>
        </span>
      </span>
    </el-tree>
    <!-- 骨架屏加载效果 -->
    <el-skeleton v-else :rows="5" animated></el-skeleton>
  </div>
</template>

<script>
import { debounce } from 'lodash';

export default {
  name: 'categoryTree',
  props: {
    // 接收父组件传递的档案分类数据
    fileOptions: {
      type: Array,
      required: true,
    },
    defaultExpandAll: {
      type: Boolean,
      default: false,
    },
    isClick:{
      type: Boolean,
      default:true,
    },
    show:{
      type: Boolean,
      default:false,
    },

  },
  data() {
    return {
      searchText: '', // 搜索框输入的文本
      fileProps: {
        children: 'children',
        label: 'label',
      },
      clickNode: null, // 点击节点的ID
      parentList:[]// 父级分类ID列表
    };
  },
  methods: {
    // 处理节点点击事件，传递节点ID给父组件
    handleNodeClick(data) {
      if(this.isClick){
        this.clickNode = data.id;
      this.$emit('node-click', data);
      }
    },
    handleCheckChange(data, checked, indeterminate) {
      this.$emit('check-change', data, checked, indeterminate);
      },
    // 过滤树节点
    fileNode(value, data) {
      if (!value) return true;
      if(data.parentId===0){
        const a = data.label.toLowerCase().includes(value.toLowerCase());
        if(a === true){
          this.parentList.push(data.id)
        }
        return a;
      }else{
        const b = this.parentList.indexOf(data.parentId) > -1;
        if(b === true){
          return b;
        }else{
          return data.label.toLowerCase().includes(value.toLowerCase());
        }
      }
    },
    // 防抖处理搜索框输入，防止频繁过滤
    debounceFilterTree: debounce(function (value) {
      this.$refs.tree.filter(value);
    }, 300),
    clear(){
      this.clickNode = null;
    },
    reset() {
      this.$nextTick(() => {
        this.$refs.tree.setCheckedKeys([]);
      });
    },
    setNode(id){
      this.clickNode = id;
    }
  },
};
</script>

<style scoped>
.file-style {
  max-height: calc(100vh - 160px);
  overflow-y: auto;
}
</style>
