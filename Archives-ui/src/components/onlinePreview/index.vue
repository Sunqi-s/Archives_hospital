<template>
  <div>
    <div v-if="showIframe">
      <iframe ref="iframe" :src="iframeSrc" width="100%" height="1000vh" style="border: none;"></iframe>
    </div>
  </div>
</template>

<script>
import { Base64 } from 'js-base64';

export default {
  name: 'onlinePreview',
  props: {
    initialUrl: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      showIframe: true,
      iframeSrc: ''
    };
  },
  methods: {
    openIframe() {
      const encodedUrl = encodeURIComponent(Base64.encode(process.env.VUE_APP_FILE_SERVER_BASE_URL + this.initialUrl));
      this.iframeSrc = `/preview/onlinePreview?url=${encodedUrl}`;
      this.showIframe = true;
    },
    reset() {
      this.showIframe = false;
      this.iframeSrc = '';
    }
  },
  created() {
    setTimeout(() => {
      this.openIframe();
    }, 100); // 延迟1毫秒，几乎立即执行
  }
}
</script>
