import request from '@/utils/request'

// 查询档案信息模板列表
export function listItem(query) {
  return request({
    url: '/archive/item/list',
    method: 'get',
    params: query
  })
}

export function listItemSuccess(query) {
  return request({
    url: '/archive/item/listSuccess',
    method: 'get',
    params: query
  })
}


// 查询档案信息模板详细
export function getItem(id) {
  return request({
    url: '/archive/item/' + id,
    method: 'get'
  })
}

// 查询档案信息模板详细
export function getItemByCategoryId(categoryId) {
  return request({
    url: '/archive/item/categoryId/' + categoryId,
    method: 'get'
  })
}

// 新增档案信息模板
export function addItem(data) {
  return request({
    url: '/archive/item',
    method: 'post',
    data: data
  })
}

// 修改档案信息模板
export function updateItem(data) {
  return request({
    url: '/archive/item',
    method: 'put',
    data: data
  })
}

// 删除档案信息模板
export function delItem(id) {
  return request({
    url: '/archive/item/' + id,
    method: 'delete'
  })
}
