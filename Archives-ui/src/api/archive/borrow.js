import request from '@/utils/request';

// 查询ArchiveBorrow列表
export function listBorrow(query) {
  return request({
    url: '/archive/borrow/list',
    method: 'get',
    params: query
  })
}

// 查询ArchiveBorrow详细
export function getBorrow(id) {
  return request({
    url: '/archive/borrow/' + id,
    method: 'get'
  })
}

// 新增ArchiveBorrow
export function addBorrow(data) {
  return request({
    url: '/archive/borrow',
    method: 'post',
    data: data
  })
}

// 修改ArchiveBorrow
export function updateBorrow(data) {
  return request({
    url: '/archive/borrow',
    method: 'put',
    data: data
  })
}

// 删除ArchiveBorrow
export function delBorrow(id) {
  return request({
    url: '/archive/borrow/' + id,
    method: 'delete'
  })
}

export function borrow(data) {
  return request({
    url: '/archive/borrow/infoList/',
    method: 'post',
    data: data,
  });
}

export function borrowUser() {
  return request({
    url: '/archive/borrow/user/',
    method: 'post',
  });
}

export function borrowDetail(data) {
  return request({
    url: '/archive/borrow/infoList/all/',
    method: 'post',
    data: data,
  });
}




