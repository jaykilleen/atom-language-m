'use babel';

import LanguageMView from './language-m-view';
import { CompositeDisposable } from 'atom';

export default {

  languageMView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.languageMView = new LanguageMView(state.languageMViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.languageMView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'language-m:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.languageMView.destroy();
  },

  serialize() {
    return {
      languageMViewState: this.languageMView.serialize()
    };
  },

  toggle() {
    console.log('LanguageM was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
