return {
	['english'] = {
		loader='hyphen.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={ 'usenglish','USenglish','american' },
		patterns='',
		hyphenation='',
	},
	['afrikaans'] = {
		loader='loadhyph-af.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-af.pat.txt',
		hyphenation='hyph-as.hyp.txt',
	},
	['ancientgreek'] = {
		loader='loadhyph-grc.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-grc.pat.txt',
		hyphenation='hyph-grc.hyp.txt',
	},
	['arabic'] = {
		loader='zerohyph.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='',
		hyphenation='',
	},
	['armenian'] = {
		loader='loadhyph-hy.tex',
		lefthyphenmin=1,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-hy.pat.txt',
		hyphenation='hyph-hy.hyp.txt',
	},
	['assamese'] = {
		loader='loadhyph-as.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-as.pat.txt',
		hyphenation='hyph-as.hyp.txt',
	},
	['basque'] = {
		loader='loadhyph-eu.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-eu.pat.txt',
		hyphenation='hyph-eu.hyp.txt',
	},
	['bengali'] = {
		loader='loadhyph-bn.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-bn.pat.txt',
		hyphenation='hyph-bn.hyp.txt',
	},
	['bokmal'] = {
		loader='loadhyph-nb.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={ 'norwegian','norsk' },
		patterns='hyph-nb.pat.txt',
		hyphenation='hyph-nb.hyp.txt',
	},
	['bulgarian'] = {
		loader='loadhyph-bg.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-bg.pat.txt',
		hyphenation='hyph-bg.hyp.txt',
	},
	['catalan'] = {
		loader='loadhyph-ca.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-ca.pat.txt',
		hyphenation='',
	},
	['classiclatin'] = {
		loader='loadhyph-la-x-classic.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-la-x-classic.pat.txt',
		hyphenation='hyph-la-x-classic.hyp.txt',
	},
	['coptic'] = {
		loader='loadhyph-cop.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-cop.pat.txt',
		hyphenation='hyph-cop.hyp.txt',
	},
	['croatian'] = {
		loader='loadhyph-hr.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-hr.pat.txt',
		hyphenation='hyph-hr.hyp.txt',
	},
	['czech'] = {
		loader='loadhyph-cs.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-cs.pat.txt',
		hyphenation='',
	},
	['danish'] = {
		loader='loadhyph-da.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-da.pat.txt',
		hyphenation='hyph-da.hyp.txt',
	},
	['dutch'] = {
		loader='loadhyph-nl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-nl.pat.txt',
		hyphenation='',
	},
	['esperanto'] = {
		loader='loadhyph-eo.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-eo.pat.txt',
		hyphenation='hyph-eo.hyp.txt',
	},
	['estonian'] = {
		loader='loadhyph-et.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-et.pat.txt',
		hyphenation='hyph-et.hyp.txt',
	},
	['farsi'] = {
		loader='zerohyph.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={ 'persian' },
		patterns='',
		hyphenation='',
	},
	['finnish'] = {
		loader='loadhyph-fi.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-fi.pat.txt',
		hyphenation='hyph-fi.hyp.txt',
	},
	['french'] = {
		loader='loadhyph-fr.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={ 'patois','francais' },
		patterns='hyph-fr.pat.txt',
		hyphenation='hyph-fr.hyp.txt',
	},
	['galician'] = {
		loader='loadhyph-gl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-gl.pat.txt',
		hyphenation='hyph-gl.hyp.txt',
	},
	['georgian'] = {
		loader='loadhyph-ka.tex',
		lefthyphenmin=1,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-ka.pat.txt',
		hyphenation='hyph-ka.hyp.txt',
	},
	['german'] = {
		loader='loadhyph-de-1901.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-de-1901.pat.txt',
		hyphenation='hyph-de-1901.hyp.txt',
	},
	['german-x-2017-03-31'] = {
		loader='dehypht-x-2017-03-31.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={ 'german-x-latest' },
		patterns='',
		hyphenation='',
	},
	['greek'] = {
		loader='loadhyph-el-polyton.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={ 'polygreek' },
		patterns='hyph-el-polyton.pat.txt',
		hyphenation='hyph-el-polyton.hyp.txt',
	},
	['gujarati'] = {
		loader='loadhyph-gu.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-gu.pat.txt',
		hyphenation='hyph-gu.hyp.txt',
	},
	['hindi'] = {
		loader='loadhyph-hi.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-hi.pat.txt',
		hyphenation='hyph-hi.hyp.txt',
	},
	['hungarian'] = {
		loader='loadhyph-hu.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-hu.pat.txt',
		hyphenation='hyph-hu.hyp.txt',
	},
	['icelandic'] = {
		loader='loadhyph-is.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-is.pat.txt',
		hyphenation='hyph-is.hyp.txt',
	},
	['indonesian'] = {
		loader='loadhyph-id.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-id.pat.txt',
		hyphenation='hyph-id.hyp.txt',
	},
	['interlingua'] = {
		loader='loadhyph-ia.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-ia.pat.txt',
		hyphenation='',
	},
	['irish'] = {
		loader='loadhyph-ga.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-ga.pat.txt',
		hyphenation='',
	},
	['italian'] = {
		loader='loadhyph-it.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-it.pat.txt',
		hyphenation='hyph-it.hyp.txt',
	},
	['kannada'] = {
		loader='loadhyph-kn.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-kn.pat.txt',
		hyphenation='hyph-kn.hyp.txt',
	},
	['kurmanji'] = {
		loader='loadhyph-kmr.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-kmr.pat.txt',
		hyphenation='hyph-kmr.hyp.txt',
	},
	['latin'] = {
		loader='loadhyph-la.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-la.pat.txt',
		hyphenation='hyph-la.hyp.txt',
	},
	['latvian'] = {
		loader='loadhyph-lv.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-lv.pat.txt',
		hyphenation='hyph-lv.hyp.txt',
	},
	['lithuanian'] = {
		loader='loadhyph-lt.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-lt.pat.txt',
		hyphenation='hyph-lt.hyp.txt',
	},
	['malayalam'] = {
		loader='loadhyph-ml.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-ml.pat.txt',
		hyphenation='hyph-ml.hyp.txt',
	},
	['marathi'] = {
		loader='loadhyph-mr.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-mr.pat.txt',
		hyphenation='hyph-mr.hyp.txt',
	},
	['mongolian'] = {
		loader='loadhyph-mn-cyrl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-mn-cyrl.pat.txt',
		hyphenation='hyph-mn-cyrl.hyp.txt',
	},
	['mongolianlmc'] = {
		loader='loadhyph-mn-cyrl-x-lmc.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='',
		hyphenation='',
	},
	['monogreek'] = {
		loader='loadhyph-el-monoton.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-el-monoton.pat.txt',
		hyphenation='hyph-el-monoton.hyp.txt',
	},
	['ngerman'] = {
		loader='loadhyph-de-1996.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-de-1996.pat.txt',
		hyphenation='hyph-de-1996.hyp.txt',
	},
	['ngerman-x-2017-03-31'] = {
		loader='dehyphn-x-2017-03-31.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={ 'ngerman-x-latest' },
		patterns='',
		hyphenation='',
	},
	['nynorsk'] = {
		loader='loadhyph-nn.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-nn.pat.txt',
		hyphenation='hyph-nn.hyp.txt',
	},
	['oriya'] = {
		loader='loadhyph-or.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-or.pat.txt',
		hyphenation='hyph-or.hyp.txt',
	},
	['panjabi'] = {
		loader='loadhyph-pa.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-pa.pat.txt',
		hyphenation='hyph-pa.hyp.txt',
	},
	['piedmontese'] = {
		loader='loadhyph-pms.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-pms.pat.txt',
		hyphenation='',
	},
	['pinyin'] = {
		loader='loadhyph-zh-latn-pinyin.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-zh-latn-pinyin.pat.txt',
		hyphenation='hyph-zh-latn-pinyin.hyp.txt',
	},
	['polish'] = {
		loader='loadhyph-pl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-pl.pat.txt',
		hyphenation='',
	},
	['portuguese'] = {
		loader='loadhyph-pt.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={ 'portuges' },
		patterns='hyph-pt.pat.txt',
		hyphenation='',
	},
	['romanian'] = {
		loader='loadhyph-ro.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-ro.pat.txt',
		hyphenation='hyph-ro.hyp.txt',
	},
	['romansh'] = {
		loader='loadhyph-rm.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-rm.pat.txt',
		hyphenation='',
	},
	['russian'] = {
		loader='loadhyph-ru.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-ru.pat.txt',
		hyphenation='',
	},
	['sanskrit'] = {
		loader='loadhyph-sa.tex',
		lefthyphenmin=1,
		righthyphenmin=5,
		synonyms={  },
		patterns='hyph-sa.pat.txt',
		hyphenation='hyph-sa.hyp.txt',
	},
	['serbian'] = {
		loader='loadhyph-sr-latn.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-sh-latn.pat.txt,hyph-sh-cyrl.pat.txt',
		hyphenation='hyph-sh-latn.hyp.txt,hyph-sh-cyrl.hyp.txt',
	},
	['serbianc'] = {
		loader='loadhyph-sr-cyrl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-sh-latn.pat.txt,hyph-sh-cyrl.pat.txt',
		hyphenation='hyph-sh-latn.hyp.txt,hyph-sh-cyrl.hyp.txt',
	},
	['slovak'] = {
		loader='loadhyph-sk.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-sk.pat.txt',
		hyphenation='',
	},
	['slovenian'] = {
		loader='loadhyph-sl.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={ 'slovene' },
		patterns='hyph-sl.pat.txt',
		hyphenation='hyph-sl.hyp.txt',
	},
	['spanish'] = {
		loader='loadhyph-es.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={ 'espanol' },
		patterns='hyph-es.pat.txt',
		hyphenation='hyph-es.hyp.txt',
	},
	['swedish'] = {
		loader='loadhyph-sv.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-sv.pat.txt',
		hyphenation='hyph-sv.hyp.txt',
	},
	['swissgerman'] = {
		loader='loadhyph-de-ch-1901.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-de-ch-1901.pat.txt',
		hyphenation='hyph-de-ch-1901.hyp.txt',
	},
	['tamil'] = {
		loader='loadhyph-ta.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-ta.pat.txt',
		hyphenation='hyph-ta.hyp.txt',
	},
	['telugu'] = {
		loader='loadhyph-te.tex',
		lefthyphenmin=1,
		righthyphenmin=1,
		synonyms={  },
		patterns='hyph-te.pat.txt',
		hyphenation='hyph-te.hyp.txt',
	},
	['thai'] = {
		loader='loadhyph-th.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-th.pat.txt',
		hyphenation='',
	},
	['turkish'] = {
		loader='loadhyph-tr.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-tr.pat.txt',
		hyphenation='hyph-tr.hyp.txt',
	},
	['turkmen'] = {
		loader='loadhyph-tk.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-tk.pat.txt',
		hyphenation='hyph-tk.hyp.txt',
	},
	['ukenglish'] = {
		loader='loadhyph-en-gb.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={ 'british','UKenglish' },
		patterns='hyph-en-gb.pat.txt',
		hyphenation='',
	},
	['ukrainian'] = {
		loader='loadhyph-uk.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-uk.pat.txt',
		hyphenation='hyph-uk.hyp.txt',
	},
	['uppersorbian'] = {
		loader='loadhyph-hsb.tex',
		lefthyphenmin=2,
		righthyphenmin=2,
		synonyms={  },
		patterns='hyph-hsb.pat.txt',
		hyphenation='hyph-hsb.hyp.txt',
	},
	['usenglishmax'] = {
		loader='loadhyph-en-us.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-en-us.pat.txt',
		hyphenation='',
	},
	['welsh'] = {
		loader='loadhyph-cy.tex',
		lefthyphenmin=2,
		righthyphenmin=3,
		synonyms={  },
		patterns='hyph-cy.pat.txt',
		hyphenation='hyph-cy.hyp.txt',
	},
}