describe('Product navigation and naviagates to product page', () => {
  it('Visits the home page', () => {
    cy.visit('http://localhost:3000'); 
    //products should be visiable
    cy.get(".products article").should("be.visible");
    //click on article for giant tea
    cy.get('article').contains("Giant Tea").click();
    //ensure navitation to correct product page
    cy.url().should("include", "/products/1");
  });

});