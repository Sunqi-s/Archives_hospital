<template>
  <el-card>
    <el-tabs v-model="activeName">
      <el-tab-pane label="字段信息" name="columnInfo">
        <el-table ref="dragTable" :data="columns" row-key="columnId" :max-height="tableHeight">
          <el-table-column label="序号" type="index" min-width="5%" class-name="allowDrag" />
          <!--<el-table-column label="字段列名" prop="columnName" min-width="10%" :show-overflow-tooltip="true" />-->
          <el-table-column label="字段名称" min-width="12%">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemName"></el-input>
            </template>
          </el-table-column>
          <el-table-column label="字段类型" min-width="15%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.itemType">
                <el-option label="整数 (Integer)" value="Integer" />
                <el-option label="长整型数 (Long)" value="Long" />
                <el-option label="文本 (String)" value="String" />
                <el-option label="小数 (Double)" value="Double" />
                <el-option label="大数 (BigDecimal)" value="BigDecimal" />
                <el-option label="日期时间 (Date)" value="Date" />
                <el-option label="布尔值 (是/否) (Boolean)" value="Boolean" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="最大长度" min-width="8%">
            <template slot-scope="scope">
              <el-input v-model="scope.row.columnLength"></el-input>
            </template>
          </el-table-column>
          <el-table-column label="添加" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox true-label="1" false-label="0" v-model="scope.row.isInsert"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="编辑" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox true-label="1" false-label="0" v-model="scope.row.isEdit"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="列表" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox true-label="1" false-label="0" v-model="scope.row.isList"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="查询" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox true-label="1" false-label="0" v-model="scope.row.isQuery"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="查询方式" min-width="10%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.queryType">
                <el-option label="=" value="EQ" />
                <el-option label="!=" value="NE" />
                <el-option label=">" value="GT" />
                <el-option label=">=" value="GTE" />
                <el-option label="<" value="LT" />
                <el-option label="<=" value="LTE" />
                <el-option label="LIKE" value="LIKE" />
                <el-option label="BETWEEN" value="BETWEEN" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="必填" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox true-label="1" false-label="0" v-model="scope.row.isRequired"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="显示类型" min-width="12%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.htmlType">
                <el-option label="文本框" value="input" />
                <el-option label="文本域" value="textarea" />
                <el-option label="下拉框" value="select" />
                <el-option label="树形下拉框" value="treeselect" />
                <el-option label="单选框" value="radio" />
                <el-option label="复选框" value="checkbox" />
                <el-option label="日期控件" value="datetime" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="字典类型" min-width="12%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.dictType" clearable filterable placeholder="请选择">
                <el-option
                  v-for="dict in dictOptions"
                  :key="dict.dictType"
                  :label="dict.dictName"
                  :value="dict.dictType">
                  <span style="float: left">{{ dict.dictName }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ dict.dictType }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="显示分组" min-width="12%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.htmlGroup">
                <el-option label="第一组" value="1" />
                <el-option label="第二组" value="2" />
                <el-option label="第三组" value="3" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="排序" min-width="15%">
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.sort" controls-position="right" :min="0" style="width: 100px;"/>
            </template>
          </el-table-column>
          <!--<el-table-column label="操作" min-width="8%">
            <template slot-scope="scope">
              <el-button type="text" size="small" @click="handleDelete(scope.$index)">删除</el-button>
            </template>
          </el-table-column>-->
        </el-table>
      </el-tab-pane>
    </el-tabs>
    <div slot="footer" class="dialog-footer" v-show="footerVisible">
      <el-button size="small" @click="handleCancel">取消</el-button>
      <el-button size="small" type="primary" @click="handleConfirm">确定</el-button>
    </div>

    <el-form label-width="100px">
      <el-form-item style="text-align: center;margin-left:-100px;margin-top:10px;">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="handleCancel">返回</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
import { getItemByCategoryId, updateItem } from "@/api/archive/item";
import { optionselect as getDictOptionselect } from "@/api/system/dict/type";

export default {
  name: "EditItem",
  data() {
    return {
      activeName: 'columnInfo',
      columns: [],
      dictOptions: [],
      tableHeight: 600,
      footerVisible: false,
    };
  },
  created() {
    const categoryId = this.$route.params && this.$route.params.categoryId;
    if (categoryId) {
      getItemByCategoryId(categoryId).then(res => {
        this.columns = res.data;
      });
      getDictOptionselect().then(res => {
        this.dictOptions = res.data;
      });
    }
  },
  methods: {
    handleDelete(index) {
      this.columns.splice(index, 1);
    },
    handleConfirm() {
      this.$emit('confirm', this.columns);
    },
    submitForm() {
        updateItem(this.columns).then(res => {
          this.$modal.msgSuccess(res.msg);
          if (res.code === 200) {
            this.handleCancel();
          }
        });
    },
    /** 关闭按钮 */
    handleCancel() {
      const obj = { path: "/system/biz-settings/category", query: { t: Date.now(), pageNum: this.$route.query.pageNum } };
      this.$tab.closeOpenPage(obj);
    }
  },
};
</script>
