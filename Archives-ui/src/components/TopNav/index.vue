<template>
  <el-menu
    :default-active="activeMenu"
    mode="horizontal"
    @select="handleSelect"
    class="topmenu-container"
  >
    <template v-for="(item, index) in topMenus">
      <el-menu-item :style="{'--theme': theme}" :index="item.path" :key="index" v-if="index < visibleNumber">
        <svg-icon
          v-if="item.meta && item.meta.icon && item.meta.icon !== '#'"
          :icon-class="item.meta.icon"
        />
        {{ item.meta.title }}
      </el-menu-item>
    </template>

    <!-- 顶部菜单超出数量折叠 -->
    <el-submenu :style="{'--theme': theme}" index="more" v-if="topMenus.length > visibleNumber">
      <template slot="title">更多菜单</template>
      <template v-for="(item, index) in topMenus">
        <el-menu-item
          :index="item.path"
          :key="index"
          v-if="index >= visibleNumber"
        >
          <svg-icon
            v-if="item.meta && item.meta.icon && item.meta.icon !== '#'"
            :icon-class="item.meta.icon"
          />
          {{ item.meta.title }}
        </el-menu-item>
      </template>
    </el-submenu>
  </el-menu>
</template>

<script>
import { constantRoutes } from "@/router";

// 隐藏侧边栏路由
const hideList = ['/index', '/user/profile'];

export default {
  data() {
    return {
      // 顶部栏初始数
      visibleNumber: 8,
      // 当前激活菜单的 index
      currentIndex: undefined
    };
  },
  computed: {
    theme() {
      return this.$store.state.settings.theme;
    },
    // 顶部显示菜单
    topMenus() {
      let topMenus = [];
      this.routers.map((menu) => {
        if (menu.hidden !== true) {
          // 兼容顶部栏一级菜单内部跳转
          if (menu.path === "/") {
            topMenus.push(menu.children[0]);
          } else {
            topMenus.push(menu);
          }
        }
      });
      return topMenus;
    },
    // 所有的路由信息
    routers() {
      return this.$store.state.permission.topbarRouters;
    },
    // 设置子路由
    childrenMenus() {
      var childrenMenus = [];
      this.routers.map((router) => {
        for (var item in router.children) {
          if (router.children[item].parentPath === undefined) {
            if(router.path === "/") {
              router.children[item].path = "/" + router.children[item].path;
            } else {
              if(!this.ishttp(router.children[item].path)) {
                router.children[item].path = router.path + "/" + router.children[item].path;
              }
            }
            router.children[item].parentPath = router.path;
          }
          childrenMenus.push(router.children[item]);
        }
      });
      return constantRoutes.concat(childrenMenus);
    },
    // 默认激活的菜单
    activeMenu() {
      const path = this.$route.path;
      let activePath = path;
      if (path !== undefined && path.lastIndexOf("/") > 0 && hideList.indexOf(path) === -1) {
        const tmpPath = path.substring(1, path.length);
        activePath = "/" + tmpPath.substring(0, tmpPath.indexOf("/"));
        if (!this.$route.meta.link) {
          this.$store.dispatch('app/toggleSideBarHide', false);
        }
      } else if(!this.$route.children) {
        activePath = path;
        this.$store.dispatch('app/toggleSideBarHide', true);
      }
      this.activeRoutes(activePath);
      return activePath;
    },
  },
  beforeMount() {
    window.addEventListener('resize', this.setVisibleNumber)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.setVisibleNumber)
  },
  mounted() {
    this.setVisibleNumber();
  },
  methods: {
    // 根据宽度计算设置显示栏数
    setVisibleNumber() {
      const width = document.body.getBoundingClientRect().width / 2;
      this.visibleNumber = parseInt(width / 85);
    },
    // 菜单选择事件
    handleSelect(key, keyPath) {
      this.currentIndex = key;
      const route = this.routers.find(item => item.path === key);
      if (this.ishttp(key)) {
        // http(s):// 路径新窗口打开
        window.open(key, "_blank");
      } else if (!route || !route.children) {
        // 没有子路由路径内部打开
        const routeMenu = this.childrenMenus.find(item => item.path === key);
        if (routeMenu && routeMenu.query) {
          let query = JSON.parse(routeMenu.query);
          this.$router.push({ path: key, query: query });
        } else {
          this.$router.push({ path: key });
        }
        this.$store.dispatch('app/toggleSideBarHide', true);
      } else {
        // 显示左侧联动菜单
        this.activeRoutes(key);
        this.$store.dispatch('app/toggleSideBarHide', false);
      }
    },
    // 当前激活的路由
    activeRoutes(key) {
      var routes = [];
      if (this.childrenMenus && this.childrenMenus.length > 0) {
        this.childrenMenus.map((item) => {
          if (key == item.parentPath || (key == "index" && "" == item.path)) {
            routes.push(item);
          }
        });
      }
      if(routes.length > 0) {
        this.$store.commit("SET_SIDEBAR_ROUTERS", routes);
      } else {
        this.$store.dispatch('app/toggleSideBarHide', true);
      }
    },
    ishttp(url) {
      return url.indexOf('http://') !== -1 || url.indexOf('https://') !== -1
    }
  },
};
</script>

<style lang="scss">
/* 顶部菜单容器样式 */
.topmenu-container.el-menu--horizontal {
  padding: 0px 20px;
  background-color: #ffffff;  // 白色背景
  border: none;  // 去掉外边框
}

/* 顶部菜单项样式 */
.topmenu-container.el-menu--horizontal > .el-menu-item {
  float: left;
  height: 50px !important;
  line-height: 50px !important;
  color: #333 !important;  // 深灰色字体
  padding: 0 15px !important;
  margin: 0;  // 去掉外边距
  font-size: 17px !important;
  font-weight: 580;
  background-color: transparent;
  transition: all 0.3s ease;
  position: relative;  // 为分隔线做准备
}

/* 在菜单项之间添加分隔线 */
.topmenu-container.el-menu--horizontal > .el-menu-item::after {
  content: '';
  position: absolute;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  width: 1px;
  height: 60%;
  background-color: #e0e6ed;  // 浅灰色分隔线
}

/* 隐藏最后一个菜单项的分隔线 */
.topmenu-container.el-menu--horizontal > .el-menu-item:last-child::after {
  display: none;
}

/* 鼠标悬停时菜单项样式 */
.topmenu-container.el-menu--horizontal > .el-menu-item:hover {
  color: #{'var(--theme)'} !important;
  background-color: rgba(#{'var(--theme)'}, 0.15);
}

/* 激活状态菜单项样式（添加底部蓝色线） */
.topmenu-container.el-menu--horizontal > .el-menu-item.is-active {
  color: #{'var(--theme)'} !important;
  border-bottom: 2px solid #{'var(--theme)'} !important;
}

/* 子菜单项样式 */
.topmenu-container.el-menu--horizontal > .el-submenu .el-submenu__title {
  float: left;
  height: 50px !important;
  line-height: 50px !important;
  color: #333 !important;
  padding: 0 15px !important;
  margin: 0;
  font-size: 15px !important;
  font-weight: 600;
  border-radius: 8px;
  background-color: transparent;
  transition: all 0.3s ease;
  position: relative;
}

/* 子菜单项之间的分隔线 */
.topmenu-container.el-menu--horizontal > .el-submenu .el-submenu__title::after {
  content: '';
  position: absolute;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  width: 1px;
  height: 60%;
  background-color: #e0e6ed;
}

/* 隐藏最后一个子菜单项的分隔线 */
.topmenu-container.el-menu--horizontal > .el-submenu .el-submenu__title:last-child::after {
  display: none;
}

/* 调整整体容器 */
.topmenu-container {
  padding: 10px 20px;
  background-color: #ffffff;  // 白色背景
  border-radius: 10px;  // 圆角设计
  border: none;  // 去掉边框
  box-shadow: none;  // 去掉阴影
}
</style>
