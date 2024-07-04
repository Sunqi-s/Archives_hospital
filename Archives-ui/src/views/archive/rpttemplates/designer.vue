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
      tpl_name: ''
    };
  },
  methods: {
    openIframe() {
      let url = `/ureport/designer`;
      if(this.tpl_name) {
        url = `/ureport/designer?_u=mysql:`+this.tpl_name;
      }
      this.iframeSrc = url;
      this.showIframe = true;
    },
    reset() {
      // 重置数据的逻辑
    }
  },
  created() {
    this.reset();
    this.tpl_name = this.$route.params.tpl_name;
    console.log(this.tpl_name);

// 直接在创建时打开预览
    setTimeout(() => {
      this.openIframe();
    }, 1); // 延迟1毫秒，几乎立即执行

  }
}
</script>
