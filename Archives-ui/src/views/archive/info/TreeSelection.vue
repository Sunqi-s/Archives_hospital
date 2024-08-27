index.vue
<template>
  <el-tree
    :data="categoryTree"
    :props="defaultProps"
    default-expand-all
    @node-click="handleNodeClick"
    :highlight-current="true"
    :current-node-key="selectedNodeKey"
  ></el-tree>
</template>

<script>
export default {
  props: {
    categoryTree: Array,
    defaultProps: Object,
    selectedNodeKey: [String, Number]
  },
  methods: {
    handleNodeClick(data) {
      this.$emit('node-click', data);
    }
  }
};
</script>
