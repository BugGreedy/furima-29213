function calc(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profitCalc = document.getElementById("profit") 
  itemPrice.addEventListener('input',function(price){
    price = itemPrice.value;
    if (price >= 300 && price <= 9999999){
    let tax = Math.round(price / 10)
    addTaxPrice.innerHTML = tax
    profitCalc.innerHTML = price - tax   
    } else { 
    addTaxPrice.innerHTML = "登録できません"
    profitCalc.innerHTML = "登録できません"
    }
  })
}
window.addEventListener('load',calc)
