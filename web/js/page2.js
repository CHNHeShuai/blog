
<!--
var pager = new ETNGpager('list','list2',12,10);//12Ϊÿҳ��ʾ������10Ϊ������ʾ�˵���
var curP = 1;
page()
function page(i){
curP =(curP>pager.cntP)?1:curP;
if(i){
curP = n =i;
}else{
n = curP++;
}
pager.curP = (n>pager.cntP)?pager.cntP:n;
pager.create();
}
//-->
