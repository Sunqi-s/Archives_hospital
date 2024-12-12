import request from '@/utils/request'

// 查询保存对于文书的年度或科技的类型的列表
export function listFit(query) {
  return request({
    url: '/archive/fit/list',
    method: 'get',
    params: query
  })
}

// 查询保存对于文书的年度或科技的类型的详细
export function getFit(id) {
  return request({
    url: '/archive/fit/' + id,
    method: 'get'
  })
}

// 新增保存对于文书的年度或科技的类型的
export function addFit(data) {
  return request({
    url: '/archive/fit',
    method: 'post',
    data: data
  })
}

// 修改保存对于文书的年度或科技的类型的
export function updateFit(data) {
  return request({
    url: '/archive/fit',
    method: 'put',
    data: data
  })
}

// 删除保存对于文书的年度或科技的类型的
export function delFit(id) {
  return request({
    url: '/archive/fit/' + id,
    method: 'delete'
  })
}
