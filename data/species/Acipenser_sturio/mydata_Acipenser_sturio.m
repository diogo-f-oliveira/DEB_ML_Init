  function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_sturio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_sturio'; 
metaData.species_en = 'European sea sturgeon'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma', 'Mda'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.2; % using criteria of LikaKear2011

metaData.author   = {'Lorna Teal','Ben Griffoen'};        
metaData.date_subm = [2014 11 07];                           
metaData.email    = {'lorna.teal@wur.nl'};                 
metaData.address  = {'IMARES, P.O. Box 68, 1970 AB IJmuiden, The Netherlands'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2015 03 18];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data
data.ah = 3;      units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = {'Ehre1894', 'DettGins1993'};    
  temp.ah = C2K(20); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = {'Ehre1894', 'DettGins1993'}; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 63;     units.aj = 'd';    label.aj = 'age at metam';           bibkey.aj = {'Ehre1894', 'DettGins1993'}; 
  temp.aj = C2K(17); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 14*365; units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'Kinz1987';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for female; for males: ap = 11 yr (Kinz1987) or 13-15 yr (Magn1962)';
data.am = 120*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'Bruc2008';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.93;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'DettGins1993';
data.Lb = 1.5;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'DettGins1993';
data.Lj = 4.5;    units.Lj = 'cm';   label.Lj = 'total length at metam';  bibkey.Lj = 'WillRoch2009';
data.Lp = 150;    units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Kinz1987';
  comment. Lp = 'for females; 185 cm (Magn1962); for males 120 cm (Kinz1987) or 145 cm (Magn1962)';
data.Li = 500;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'WillRoch2009';

data.Wwi = 4.6e5;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Acipenser_ruthenus data with Li = 120 and Wwi = 6400: 6400 * (500/120)^3 = 4.6e5; wiki: Wwi = 400 kg and Li = 6 m';
 
data.Ri = 1500;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Although metamorphosis is indicated, it is only morphological, not metabolic, so model std applied, not abj';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '9C7Q'; % Cat of Life
metaData.links.id_ITIS = '161072'; % ITIS
metaData.links.id_EoL = '46561170'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_sturio'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_sturio'; % ADW
metaData.links.id_Taxo = '42445'; % Taxonomicon
metaData.links.id_WoRMS = '126279'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-sturio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/European_sea_sturgeon}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bruc2008'; type = 'phdthesis'; bib = [ ...
'author = {Bruch, R. M.}, ' ...
'year = {2008}, ' ...
'title = {Modeling the population dynamics an sustainability of lake sturgeon in the {W}innebago system. {W}isconsin.}, ' ...
'school = {Univeristy of Wisconsin-Milwaukee}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NiklSeco2009'; type = 'Article'; bib = [ ...
'author = {Niklitschek E. J. and Secor, D. H.}, ' ...
'year = {2009}, ' ...
'title = {Dissolved oxygen, temperature and salinity effects on the ecophysiology and survival of juvenile {A}tlantic sturgeon in estuarine waters: I. {L}aboratory results}, ' ...
'journal = {Journal of Exp. Mar. Biol. and Ecol.}, ' ...
'volume = {381}, ' ...
'pages = {S150-S160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WillRoch2009'; type = 'Incollection'; bib = [ ...
'author = {Williot, P. and Rochard, E. and Kirschbaum, F.}, ' ...
'year = {2009}, ' ...
'title = {Acceptability and prerequisites for the successful introduction of sturgeon species}, ' ...
'editor = {Carmona, R. and Domezain, A. and Garcia, G. M. and Hernando-Casal, J and Rodriguez, F and Ruiz, R. M.}, ' ...
'booktitle = {Biology, conservation and sustainable development of sturgeons, Fish \& fisheries series}, ' ...
'publisher = {Springer, New York}, ' ...
'pages =  {369-384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Magn1962'; type = 'Article'; bib = [ ...
'author  = {Magnin, E.}, ' ...
'year    = {1962}, ' ...
'title   = {Recherches sur la systematique et la biologie des {A}cipenserides.}, ' ...
'journal = {Res. Piscoles. Ministere de l''agriculture. Paris, Annls. Stat. Cent. Hydrobiol. Appl.}, ' ...
'pages   = {7-244}, ' ...
'volume  = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kinz1987'; type = 'Article'; bib = [ ...
'author = {Kinzelbach, R.}, ' ...
'year = {1987}, ' ...
'title = {Das ehemalige {V}orkommen des {S}t\"{o}rs, \emph{Acipenser sturio} ({L}innaeus, 1758), im {E}nizugsgebiet des {R}heins ({C}hondrostei: {A}cipenseridae)}, ' ...
'journal = {Z. Angew. Zool.}, ' ...
'pages = {167-200}, ' ...
'volume = {74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ehre1894'; type = 'Article'; bib = [ ...
'author = {Ehrenbaum, E.}, ' ...
'year = {1894}, ' ...
'title = {Beitr\"{a}ge zur {N}aturgeschichte einiger {E}lbfische (\emph{Osmerus eperlanus} {L}., \emph{Clupea finta} {C}uv., \emph{Acerina cernua} {L}., \emph{Acipenser sturio} {L}.)}, ' ...
'journal = {Beilage zu den Mitt Deutsch Seefisch}, ' ...
'pages = {49}, ' ...
'volume = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DettGins1993'; type = 'Book'; bib = [ ...
'author = {Dettlaff, A. and Ginsburg, A. S. and Schmalhausen, O. I}, ' ...
'year = {1993}, ' ...
'title = {Sturgeon Fishes: developmental Biology and Aquaculture.}, ' ...
'publisher = {Springer-Verlag, Berlin.}, ' ...
'pages = {293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
