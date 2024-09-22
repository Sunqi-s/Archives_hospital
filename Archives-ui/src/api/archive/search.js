import request from '@/utils/request';

export function searchArchive(keyword) {
  return request({
    url: '/archive/search/list/' + keyword,
    method: 'get',
  });
}
