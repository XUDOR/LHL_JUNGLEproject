describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('allows a user to add a product to the cart', () => {
    // Start by finding a button that adds an item to the cart
    // Use .first() if you just want to select the first product
    cy.get('button').contains('Add').first().click();

    // Check if the cart count has updated
    // Assuming there is a span with id or class that reflects the cart count
    cy.get('.cart-count').should('contain', '1');
  });
});
