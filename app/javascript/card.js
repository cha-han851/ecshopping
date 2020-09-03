'use strict';
{
  let eventReady = false;
  setInterval(() => {
    const chargeForm = document.getElementById("charge-form");
      if(chargeForm){
        function addEvent(chargeForm){
         
         Payjp.setPublicKey(“PAY.pk_test_c67d52a46b67d97a86228a89”);// PAY.JPテスト公開鍵
          chargeForm.addEventListener("submit", (e) => {
    e.preventDefault();
    
          const formData = new FormData(chargeForm);
          const card = {
            number: formData.get("number"),
            cvc: formData.get("cvc"),
            exp_month: formData.get("exp_month"),
            exp_year: `20${formData.get("exp_year")}`,
           };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } 
    });
  });
}