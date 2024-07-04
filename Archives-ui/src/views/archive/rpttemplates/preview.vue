<template>
  <div>
    <div v-if="showIframe">
      <iframe ref="iframe" :src="iframeSrc" width="100%" height="1000vh" style="border: none;"></iframe>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showIframe: true,
      iframeSrc: '',
      dates_list: [], // 示例数据，需要根据实际情况初始化
      tpl_name: '',
    };
  },
  methods: {
    openIframe() {
      let url = `/ureport/preview?&_u=mysql%3A${this.tpl_name}`;  // 报表名+参数去往对应页面
      if(this.dates_list){
        url +=`&id=${this.dates_list}`;
      }
      this.iframeSrc = url;
      this.showIframe = true;
    },
    reset() {
    }
  },
  created() {
    this.dates_list = this.$route.params.dates_list;
    this.tpl_name = this.$route.params.tpl_name;
// 直接在创建时打开预览
setTimeout(() => {
  this.openIframe();
}, 1); // 延迟1毫秒，几乎立即执行

  }
}
</script>
