describe('Home Page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('successfully loads', () => {
    cy.url().should('include', '/');
  });

  it('displays products on the page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('displays the correct number of products', () => {
    cy.get('.products article').should('have.length', 2);
  });
});
