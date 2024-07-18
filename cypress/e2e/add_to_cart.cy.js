describe('Cart', () => {
  it('Visits the home page and adds item to cart', () => {
    cy.visit('http://localhost:3000'); 
    //products should be visable
    cy.get(".products article").should("be.visible");
    //verify inital state of cart is at 0
    cy.contains("My Cart (0)").should("be.visible");
    //find first article and click add to cart
    cy.get("article").first().contains("Add").click();
    //number in cart should increase by 1
    cy.contains("My Cart (1)").should("be.visible");

  });

});