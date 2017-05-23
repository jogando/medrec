import { MedrecWebappPage } from './app.po';

describe('medrec-webapp App', () => {
  let page: MedrecWebappPage;

  beforeEach(() => {
    page = new MedrecWebappPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
