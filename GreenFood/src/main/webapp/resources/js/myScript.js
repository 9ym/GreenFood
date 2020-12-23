/**
 * myScript.js
 */

/* 1000 단위 사이에 , 넣는 정규식 */
function addComma(value){
	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return value;
}

/* , 빼는 정규식 */
function subComma(value){
	value = value.toString().replace(/[^\d]+/g, "");
	return value;
}