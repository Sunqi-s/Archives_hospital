import request from '@/utils/request'

// 查询数据导入日志列表
export function listImportLog(query) {
  return request({
    url: '/archive/importLog/list',
    method: 'get',
    params: query
  })
}

// 查询数据导入日志详细
export function getImportLog(id) {
  return request({
    url: '/archive/importLog/' + id,
    method: 'get'
  })
}

// 新增数据导入日志
export function addImportLog(data) {
  return request({
    url: '/archive/importLog',
    method: 'post',
    data: data
  })
}

// 修改数据导入日志
export function updateImportLog(data) {
  return request({
    url: '/archive/importLog',
    method: 'put',
    data: data
  })
}

// 删除数据导入日志
export function delImportLog(id) {
  return request({
    url: '/archive/importLog/' + id,
    method: 'delete'
  })
}

//获取服务器端文件夹列表
// export function getServerFolderList() {
//   return request({
//     url: '/getFolders/api/folders',
//     method: 'post',
//   })
// }
