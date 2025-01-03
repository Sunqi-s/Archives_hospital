<template>
  <div>
    <el-table :data="localPaginatedTableData" class="table" @selection-change="handleSelectionChange" border resizable>
      <!-- 新增的附件列 -->
      <!-- <el-table-column label="附件" show-overflow-tooltip>
  <template slot-scope="scope">
    <el-button type="text" v-if="scope.row.sysOssList && scope.row.sysOssList.length > 0" @click="showAttachments(scope.row)">
      <el-popover placement="left" width="200" trigger="hover">
        <div v-for="(file, index) in scope.row.sysOssList" :key="index">
          <a
            @click="handleFileClick(scope.row, file)"
            @mouseover="handleMouseOver"
            @mouseleave="handleMouseLeave"
            :class="{ 'hovered': localIsHovered }"
          >
            {{ file.name }}
          </a>
        </div>
        <el-button slot="reference" type="text" icon="el-icon-connection"></el-button>
      </el-popover>
    </el-button>
    <el-tooltip content="暂无附件" placement="right" v-else>
      <el-button type="text" icon="el-icon-folder-delete" style="color: saddlebrown"></el-button>
    </el-tooltip>
  </template>
</el-table-column> -->

      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column v-for="column in columnList" v-if="column.isInsert" :key="column.prop" :prop="column.prop"
        :label="column.label" show-overflow-tooltip>
        <template slot-scope="scope">
          <span>
            <el-tooltip
              v-if="!['主键ID', '创建者', '创建时间', '更新者', '更新时间'].includes(column.label) && (scope.row.validationErrors.some(v => v.field === column.prop))"
              :content="getViolationMessage(scope.row.validationErrors, column.prop)" placement="top">
              <i class="el-icon-error"></i>
            </el-tooltip>
            <i class="el-icon-success" v-else></i>
            {{ scope.row[column.prop] }}
          </span>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination-container">
      <pagination :total="filteredTableData.length" :page.sync="pageNum" :limit.sync="pageSize"
        @pagination="handlePageChange(pageNum, pageSize)" />
    </div>
    <!-- 预览文件对话框 -->
    <el-dialog :title="previewTitle" :visible.sync="previewVisible" fullscreen>
      <onlinePreview v-if="previewVisible" :initialUrl="previewUrl" />
    </el-dialog>
  </div>
</template>

<script>
export default {
  props: {
    paginatedTableData: Array,
    columnList: Array,
    filteredTableData: Array,
    rulesList: Array,
    upFileList: Array,
    isHovered: {
      type: Boolean,
      default: false
    },
    previewTitle: "文件预览",
  },
  data() {
    return {
      localPaginatedTableData: [],
      localIsHovered: this.isHovered,
      previewUrl: "",
      previewVisible: false,
      pageNum: 1,
      pageSize: 10,
    };
  },
  created() {
    this.localPaginatedTableData = this.paginatedTableData;
    this.localIsHovered = this.isHovered;
  },
  watch: {
    paginatedTableData(newVal) {
      this.localPaginatedTableData = newVal;
    },
    isHovered(newVal) {
      this.localIsHovered = newVal;
    },
  },
  methods: {
    handleSelectionChange(val) {
      this.$emit('selection-change', val);
    },
    handlePageChange(pageNum, pageSize) {
      this.$emit('page-change', { pageNum: pageNum, pageSize: pageSize });
    },
    updatePage(num, size) {
      this.pageNum = num;
      this.pageSize = size;
    },
    getViolationMessage(validationErrors, field) {
      const violation = validationErrors.find(v => v.field === field);
      return violation ? violation.messsage : '';
    },
    showAttachments(row) {
      console.log('Attachments for row:', row);
    },
    handleFileClick(row, file) {
      this.previewUrl = file.url;
      this.previewVisible = true;
    },
    handleMouseOver() {
      this.localIsHovered = true;
    },
    handleMouseLeave() {
      this.localIsHovered = false;
    },
  }
};
</script>

<style>
.el-icon-success {
  color: green;
}

.el-icon-error {
  color: red;
}

</style>
