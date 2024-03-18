describe('Product Details', () => {
  beforeEach(() => {
    // Start from the home page before each test
    cy.visit('/');
  });

  it('allows navigation from the home page to the product detail page', () => {
    // Click on the first product link by targeting the product card's link
    cy.get('.products article').first().find('header a').click();

    // Confirm that we are on the product detail page by checking if the .product-detail exists
    cy.get('.product-detail').should('exist');

    // Further checks can include checking the presence of product name, price, description, etc.
    cy.get('.product-detail h1').should('be.visible');
    cy.get('.product-detail .price').should('be.visible');
    cy.get('.product-detail .description').should('be.visible');
  });
});
