import request from '@/utils/request'

// 查询档案分类列表
export function listCategory(query) {
  return request({
    url: '/archive/category/list',
    method: 'get',
    params: query
  })
}

// 查询档案分类详细
export function getCategory(id) {
  return request({
    url: '/archive/category/' + id,
    method: 'get'
  })
}

// 新增档案分类
export function addCategory(data) {
  return request({
    url: '/archive/category',
    method: 'post',
    data: data
  })
}

// 修改档案分类
export function updateCategory(data) {
  return request({
    url: '/archive/category',
    method: 'put',
    data: data
  })
}

// 删除档案分类
export function delCategory(id) {
  return request({
    url: '/archive/category/' + id,
    method: 'delete'
  })
}
