import request from '@/utils/request';

export function borrow(data) {
  return request({
    url: '/archive/borrow/list/',
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
    url: '/archive/borrow/list/all/',
    method: 'post',
    data: data,
  });
}




