const serviceUrl = 'https://api.eol.cn/zsgk/api';
const serverPath = {
  'schoolList': serviceUrl, //学校排行
  'schoolDetail': 'https://static-data.eol.cn/www/2.0/schoolprovinceindex', //学校详情
  'schoolDetailTest': 'https://easy-mock.com/mock/5d1a07eea71c21114c52d7a1/schools/details',
  'getCategory': serviceUrl + 'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl + 'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById': serviceUrl + 'wxmini/getGoodDetailById', //商品详细信息
};