/**
 * myScript.js
 */

function changeDateString(timestamp) {
	
	
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	
}

function make2digits(num) {
	if (num < 10) {
		num = "0" + num;
	}
	return num;
}


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

/* 할인된 값 */
/*function getSalePrice(price, saleRate) {
	price = Math.ceil(price * (100 - saleRate) / 100); 
	return price;
}*/