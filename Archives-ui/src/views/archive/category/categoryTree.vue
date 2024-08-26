<template>
  <div>
    <!-- 搜索输入框 -->
    <el-input
      v-model="searchText"
      placeholder="请输入搜索内容"
      clearable
      size="small"
      prefix-icon="el-icon-search"
      @input="debounceFilterTree"
    ></el-input>
    <!-- 树形结构 -->
    <el-tree
      v-if="fileOptions"
      :data="fileOptions"
      :props="fileProps"
      @node-click="handleNodeClick"
      default-expand-all
      :filter-node-method="fileNode"
      ref="tree"
      class="file-style"
    ></el-tree>
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
  },
  data() {
    return {
      searchText: '', // 搜索框输入的文本
      fileProps: {
        children: 'children',
        label: 'label',
      },
    };
  },
  methods: {
    // 处理节点点击事件，传递节点ID给父组件
    handleNodeClick(data) {
      this.$emit('node-click', data);
    },
    // 过滤树节点
    fileNode(value, data) {
      if (!value) return true;
      return data.label.toLowerCase().includes(value.toLowerCase());
    },
    // 防抖处理搜索框输入，防止频繁过滤
    debounceFilterTree: debounce(function (value) {
      this.$refs.tree.filter(value);
    }, 300),
  },
};
</script>

<style scoped>
.file-style {
   overflow: auto;
}
</style>
