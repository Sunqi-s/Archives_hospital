<template>
    <div class="app-container">
        <el-form :model="searchValue" ref="form" size="small" :inline="true" v-show="showSearch" label-width="68px">
            <el-form-item label="选择日期">
                <el-date-picker v-model="searchValue.createTime" align="right" type="date" placeholder="选择日期"
                    :picker-options="pickerOptions" value-format="yyyy-MM-dd">
                </el-date-picker>
            </el-form-item>
            <el-form-item label="退回人">
                <el-input v-model="searchValue.placeonfileBy" placeholder="请输入退回人" />
            </el-form-item>
            <el-form-item label="单号">
                <el-input v-model="searchValue.oddNumbers" placeholder="请输入单号" />
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
                <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>
        <el-table v-loading="loading" :data="placeonfileList" style="width: 100%; margin-top: 10px;">
            <el-table-column v-for="item in tableHeaders" :key="item.name" :prop="item.name" :label="item.label"
                :render-header="renderHeader">
                <template slot-scope="scope">
                    {{ scope.row[item.name] }}
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                    <el-button @click="handleDetail(scope.row)">详情</el-button>
                </template>
            </el-table-column>
        </el-table>
        <pagination :total="total" :page.sync="searchValue.pageNum" :limit.sync="searchValue.pageSize"
            @pagination="handleNextPage" />

        <el-dialog title="详情" :visible.sync="showDetail" fullscreen :before-close="handleClose">
            <el-table v-loading="vloading" :data="infoList">
                <el-table-column label="档号" prop="archiveNumber" width="250"></el-table-column>
                <el-table-column label="题名" prop="field3"></el-table-column>
            </el-table>
            <pagination :total="vtotal" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
                @pagination="vhandleNextPage" />
            <div slot="footer">
                <el-button @click="handleClose" v-if="queryParams.pageSize>10">关 闭</el-button>
            </div>
        </el-dialog>
    </div>


</template>
<script>
import { listPlaceonlog, getIdByOddNumbers } from '@/api/archive/placeonlog';
import {getInfoByIds} from '@/api/archive/info';

export default {
    data() {
        return {
            // 显示搜索条件
            showSearch: true,
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                },
                shortcuts: [{
                    text: '今天',
                    onClick(picker) {
                        picker.$emit('pick', new Date());
                    }
                }, {
                    text: '昨天',
                    onClick(picker) {
                        const date = new Date();
                        date.setTime(date.getTime() - 3600 * 1000 * 24);
                        picker.$emit('pick', date);
                    }
                }, {
                    text: '一周前',
                    onClick(picker) {
                        const date = new Date();
                        date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                        picker.$emit('pick', date);
                    }
                }]
            },
            tableHeaders: [
                {
                    label: '单号',
                    name: 'oddNumbers'
                },
                {
                    label: '文件数量',
                    name: 'placeonfileInfo'
                },
                {
                    label: '退回人',
                    name: 'placeonfileBy'
                },
                {
                    label: '退回时间',
                    name: 'createTime'
                },
            ],
            showDetail: false,
            loading: false,
            vloading: false,
            total: 0,
            vtotal: 0,
            searchValue: {
                createTime: '',
                placeonfileBy: '',
                oddNumbers: null,
                type:'tuihui',
                pageNum: 1,
                pageSize: 10,
            },
            queryParams : {
                ids: [],
                pageNum: 1,
                pageSize: 10
            },
            placeonfileList: [],
            infoIdList: [],
            infoList: [],
            isClick: false,
        }
    },
    created(){
        this.getPlaceonlogList();
    },
    methods: {
        getPlaceonlogList(){
            if(this.isClick){
                return;
            }
            this.loading = true;
            this.isClick = true;
            listPlaceonlog(this.searchValue).then(res => {
                this.placeonfileList = res.rows
                this.total = res.total
                this.loading = false;
                this.isClick = false;
            })
        },
        handleNextPage(){
            this.getPlaceonlogList();
        },
        handleQuery(){
            this.getPlaceonlogList();
        },
        resetQuery() {
            this.searchValue = {
                createTime: '',
                placeonfileBy: '',
                oddNumbers: null,
                type: 'tuihui',
                pageNum: 1,
                pageSize: 10,
            };
            this.getPlaceonlogList();
        },
        handleExport(){

        },
        renderHeader(h, { column, $index }) {
            let realWidth = 0;
            let span = document.createElement('span');

            span.innerText = column.label;
            document.body.appendChild(span);

            realWidth = span.getBoundingClientRect().width;
            column.minWidth = realWidth; // 可能还有边距/边框等值，需要根据实际情况加上

            document.body.removeChild(span);
            return h('span', column.label);
        },
        handleDetail(row){
            this.showDetail = true;
            let infoId = '';
            this.vtotal = row.placeonfileInfo;
            getIdByOddNumbers(row.oddNumbers).then(response => {
                for (let i = 0; i < response.data.length; i++) {
                    infoId = response.data[i];
                    infoId = infoId.split(',').map(item => parseInt(item, 10));
                    this.infoIdList.push(...infoId);
                }
                this.getInfoList();
            })
        },
        getInfoList(){
            this.vloading = true;
            const startIndex = (this.queryParams.pageNum - 1) * this.queryParams.pageSize;
            const endIndex = startIndex + this.queryParams.pageSize;
            this.queryParams.ids = this.infoIdList.slice(startIndex, endIndex);
            getInfoByIds(this.queryParams.ids).then(response => {
                this.infoList = response.data;
                this.vloading = false;
            })
        },
        vhandleNextPage(){
            this.getInfoList();
        },
        handleClose(){
            this.showDetail = false;
            this.queryParams = {
                ids: [],
                pageNum: 1,
                pageSize: 10
            };
            this.infoList = [];
        },
    }
}
</script>
<style></style>