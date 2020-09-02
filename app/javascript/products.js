function products(){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const formprice = price.value;
    const formfee = Math.floor(formprice / 10);
    const formprofit = (formprice - formfee);

    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    fee.innerHTML = formfee
    profit.innerHTML = formprofit
  });
}
window.addEventListener('load', products);