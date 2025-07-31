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
          <span :style="clickNode === data.id && data.parentId>0? 'color:#409eff':''">{{ data.label }} </span>
          <!-- 添加展开按钮 -->
          &nbsp;
          <el-button v-if="(!data.children || data.children.length === 0) && (showFit === true && data.type === 1)" icon="el-icon-arrow-down" size="mini" style="border: none;" @click="handleExpand(data)"></el-button>
        </span>
      </span>
    </el-tree>
    <!-- 骨架屏加载效果 -->
    <el-skeleton v-else :rows="5" animated></el-skeleton>
  </div>
</template>

<script>
import { debounce } from 'lodash';
import { listFit } from '@/api/archive/fit'

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
    showFit: {
      type: Boolean,
      default: false,
    }
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
    },
    // 处理展开按钮点击事件
    async handleExpand(data) {
      if (!data.children || data.children.length === 0) {
        let newData = {};
        const response = await listFit({categoryId: data.id});
        if (response.rows.length > 0){
          newData = response.rows.map(item => ({
            id: `${data.id}-${item.syllable}`,
            label: item.syllable,
            parentId: data.id,
            categoryId: data.id,
            query: item.query,
            type: 3
          }));
        }else {
          newData = {
            id: `${data.id}-null`,
            label: '无数据',
            parentId: data.id,
            categoryId: data.id,
            query: null,
            type: 3
          }
        }

        this.$refs.tree.updateKeyChildren(data.id, newData);
      }
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
