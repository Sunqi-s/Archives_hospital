import request from '@/utils/request'

// 查询档案报表关系列表
export function listRelation(query) {
  return request({
    url: '/archive/relation/list',
    method: 'get',
    params: query
  })
}

// 查询档案报表关系详细
export function getRelation(id) {
  return request({
    url: '/archive/relation/' + id,
    method: 'get'
  })
}

// 新增档案报表关系
export function addRelation(data) {
  return request({
    url: '/archive/relation',
    method: 'post',
    data: data
  })
}

// 修改档案报表关系
export function updateRelation(data) {
  return request({
    url: '/archive/relation',
    method: 'put',
    data: data
  })
}

// 删除档案报表关系
export function delRelation(id) {
  return request({
    url: '/archive/relation/' + id,
    method: 'delete'
  })
}

export function pointRelation(categoryId) {
  return request({
    url:'/archive/relation/pointByCategoryId/' + categoryId,
    method: 'get'
  })
}
