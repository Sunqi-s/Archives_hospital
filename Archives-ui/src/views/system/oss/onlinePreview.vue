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
      url: ''// 示例数据，需要根据实际情况初始化
    };
  },
  methods: {
    openIframe() {
      let url = `/preview/onlinePreview?url=${this.url}`;  // 报表名+参数去往对应页面
      this.iframeSrc = url;
      this.showIframe = true;
    },
    reset() {
    }
  },
  created() {
    this.url = this.$route.params.url;
// 直接在创建时打开预览
setTimeout(() => {
  this.openIframe();
}, 100); // 延迟1毫秒，几乎立即执行

  }
}
</script>
