function [data, auxData, metaData, txtData, weights] = mydata_Spisula_solidissima

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Venerida';
metaData.family     = 'Mactridae';
metaData.species    = 'Spisula_solidissima';
metaData.species_en = 'Atlantic surf clam';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14);
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Ri'};
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'};

metaData.COMPLETE = 2.5;

metaData.author    = {'Romain Lavaud'};
metaData.date_subm = [2018 01 22];
metaData.email     = {'romain.lavaud@dfo-mpo.gc.ca'};
metaData.address   = {'Fisheries and Ocean Canada, Moncton, Canada'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 01 23]; 

%% Set zero-variate data;
data.ab   = 2;        units.ab      = 'd'; label.ab      = 'age at birth';         bibkey.ab = 'EystMors1984';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj   = 30;       units.aj      = 'd'; label.aj      = 'age at metamorphosis'; bibkey.aj = 'FayNeve1983';
  temp.aj = C2K(20);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap   = 365 * 1;  units.ap      = 'd'; label.ap      = 'age at puberty';       bibkey.ap = 'CargGrie1999';
  temp.ap = C2K(12);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am   = 365 * 31; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'JoneThom1978';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.0056; units.Lb = 'cm'; label.Lb = 'shell length at birth';         bibkey.Lb = 'Alle1953';
data.Lj = 0.025;  units.Lj = 'cm'; label.Lj = 'shell length at metamorphosis'; bibkey.Lj = 'Rope1980';
data.Lp = 4;      units.Lp = 'cm'; label.Lp = 'shell length at puberty';       bibkey.Lp = 'CargGrie1999';
data.Li = 22.6;   units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'Rope1980';

data.Wdb = 9.19e-8; units.Wdb = 'g'; label.Wdb = 'dry tissue weight at birth';         bibkey.Wdb = 'Guess';
  comment.Wdb = 'computed from Lb';
data.Wdj = 8.18e-6; units.Wdj = 'g'; label.Wdj = 'dry tissue weight at metamorphosis'; bibkey.Wdj = 'Guess';
  comment.Wdj = 'computed from Lj';

data.Ri    = 3.6e5;   units.Ri      = '#/d'; label.Ri      = 'maximum reprod rate'; bibkey.Ri = 'WalkHurl1996';
  temp.Ri  = C2K(20); units.temp.Ri = 'K';   label.temp.Ri = 'temperature';
comment.Ri = 'Value estimated from measurements on mid-age individuals';

%% Set uni-variate data
 % Time vs. shell length (North and South populations)
data.tL1 = [365 730 1095 1460 1825 2190 2555 2920 3285 3650 4015 4380 4745 5110 5475 5840; % d, time since birth
            3.82 7.34 9.9 11.76 13.12 14.1 14.82 15.34 15.71 15.99 16.19 16.33 16.44 16.52 16.57 16.61]'; % cm, shell length at f and T
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'shell length'};
temp.tL1 = C2K(15); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'Offshore Mid-Atlantic - yearly average temperature'; bibkey.tL1 = 'MuraSerc1979';

data.tWw = [365 730 1095 1460 1825 2190 2555 2920 3285 3650 4015 4380 4745 5110 5475 5840; % d, time since birth
            3.63 20.18 44.25 69.52 92.51 111.84 127.33 139.38 148.57 155.49 160.62 164.42 167.23 169.29 170.80 171.88]'; % g, tissue weight at f and T
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'tissue weight'};
temp.tWw = C2K(15); units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
comment.tWw = 'Offshore Mid-Atlantic - yearly average temperature'; bibkey.tWw = 'MuraSerc1979';

data.LN = [2.62 3.21 3.36 3.42 3.50 3.51 3.65 3.72 3.83 3.90 3.90 4.02 4.05 4.50 4.50 4.70 4.73 4.81 5.03; % cm, shell length
           0.26 1.10 2.97 3.14 4.09 2.28 3.45 2.72 0.33 3.01 5.84 13.41 7.59 6.34 7.13 7.09 7.13 6.40 7.67]'; % #10e6 number of eggs
data.LN(:,2) = 1e6 * data.LN(:,2); % convert to millions
units.LN = {'cm', '#'}; label.LN = {'shell length', 'fecundity'};
temp.LN = C2K(20); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'WalkHurl1996';

%% Set weights for all real data
weights = setweights(data, []);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4Z977'; % Cat of Life
metaData.links.id_ITIS = '80944'; % ITIS
metaData.links.id_EoL = '46471945'; % Ency of Life
metaData.links.id_Wiki = 'Spisula_solidissima'; % Wikipedia
metaData.links.id_ADW = 'Spisula_solidissima'; % ADW
metaData.links.id_Taxo = '39754'; % Taxonomicon
metaData.links.id_WoRMS = '156996'; % WoRMS
metaData.links.id_molluscabase = '156996'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spisula_solidissima}},'...
'note = {Accessed : 2015-04-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Guess'; type = 'Misc'; bib = [...
'note = {Guestimation}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Alle1953'; type = 'Article'; bib = [ ...
'author = {Allen, R. D.}, ' ...
'year = {1953}, ' ...
'title = {Fertilization and artificial activation in the egg of the surf-clam \emph{Spisula solidissima}}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {105}, ' ...
'pages = {213--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CargGrie1999'; type = 'Article'; bib = [ ...
'author = {Cargnelli, L. M. and Griesbach, S. J. and Packer, D. B. and Weissberger, E.}, ' ...
'year = {1999}, ' ...
'title = {Essential fish habitat source document: {A}tlantic surfclam, \emph{Spisula solidissima}, life history and habitat characteristics}, ' ...
'journal = {NOAA Technical Memorandum NMFS-NE}, ' ...
'volume = {142}, ' ...
'pages = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EystMors1984'; type = 'Article'; bib = [ ...
'author = {Eyster, L. S. and Morse, M. P.}, ' ...
'year = {1984}, ' ...
'title = {Early shell formation during molluscan embryogenesis, with new studies on the surf clam \emph{Spisula solidissima}}, ' ...
'journal = {Amer. Zool.}, ' ...
'volume = {24}, ' ...
'pages = {871--882}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FayNeve1983'; type = 'Article'; bib = [ ...
'author = {Fay, C. W. and Neves, R. J. and Pardue, G. B.}, ' ...
'year = {1983}, ' ...
'title = {Species profiles: life histories and environmental requierements of coastal fishes and invertebrates ({M}id-{A}tlantic): surf clam}, ' ...
'journal = {U.S. Fish Wildl. Serv., Div. Biol. Serv.}, ' ...
'volume = {WS/OBS-82/11.13}, ' ...
'pages = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneThom1978'; type = 'Article'; bib = [ ...
'author = {Jones, D. S. and Thompson, I. and Ambrose, W.}, ' ...
'year = {1978}, ' ...
'title = {Age and growth rate determinations for the {A}tlantic surf clam \emph{Spisula solidissima} ({B}ivalvia: {M}actracea), based on internal growth lines in shell cross-sections}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {47}, ' ...
'pages = {63--70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuraSerc1979'; type = 'Article'; bib = [ ...
'author = {Murawski, S. A. and Serchuk, F. M.}, ' ...
'year = {1979}, ' ...
'title = {An assessment of offshore surf clam, \emph{Spisula solidissima}, populations off the {M}iddle {A}tlantic Coast of the {U}nited {S}tates}, ' ...
'journal = {US Dep. Comm., Nat. Mar. Fish. Servo Woods Hole Lab.}, ' ...
'volume = {79}, ' ...
'pages = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rope1980'; type = 'Article'; bib = [ ...
'author = {Ropes, J. W.}, ' ...
'year = {1980}, ' ...
'title = {Biological and fisheries data on the {A}tlantic surf clam, \emph{Spisula solidissima} ({D}illwyn)}, ' ...
'journal = {U.S. Natl. Mar. Fish. Serv., Northeast Fish. Cent. Sandy Hook Lab Tech. Ser. Rep.}, ' ...
'volume = {24}, ' ...
'pages = {88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WalkHurl1996'; type = 'Article'; bib = [ ...
'author = {Walker, R. L. and Hurley, D. H. and Jansen, M. L.}, ' ...
'year = {1996}, ' ...
'title = {Fecundity of the {S}outhern {A}tlantic Surfclam \emph{Spisula solidissima similis}}, ' ...
'journal = {The Progressive fish-culturist}, ' ...
'volume = {58}, ' ...
'number = {4}, ' ...
'pages = {253--257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

