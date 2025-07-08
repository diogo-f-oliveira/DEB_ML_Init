function [data, auxData, metaData, txtData, weights] = mydata_Achatina_achatina

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Achatinidae';
metaData.species    = 'Achatina_achatina'; 
metaData.species_en = 'African giant snail'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 28]; 

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'petsnails';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'petsnails';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'petsnails';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6;   units.Lb  = 'cm';  label.Lb  = 'length at birth';       bibkey.Lb  = 'Hoda1982';
data.Li  = 11;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Hoda1982';

data.Ww7 = 59.2;  units.Ww7 = 'g'; label.Ww7 = 'life wet weight at 7.8 cm'; bibkey.Ww7 = 'AlukAdis2014';

data.Ri  = 300/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'petsnails';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.093	0.656
0.178	1.312
0.251	2.201
0.331	2.494
0.399	2.887
0.477	3.908
0.548	4.350
0.627	4.378
0.703	4.637
0.788	5.426
0.865	6.033
0.942	6.889
1.010	7.364
1.094	7.739
1.161	8.016
1.245	8.242
1.312	8.453
1.404	8.612
1.474	8.673
1.545	8.718
1.720	8.723
1.783	9.083
1.862	9.110
1.933	9.172
2.008	9.299
2.083	9.426
2.162	9.487
2.241	9.548
2.299	9.643
2.387	9.670
2.466	9.830];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hoda1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Largest land snail';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Reproduction is sometimes by self-fertilization and oviposition occurs in the second and third years and sometimes up to five years after the first oviposition year';
metaData.bibkey.F2 = 'petsnails'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '9697'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47369599'; % Ency of Life
metaData.links.id_Wiki = 'Achatina_achatina'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '38688'; % Taxonomicon
metaData.links.id_WoRMS = '820077'; % WoRMS
metaData.links.id_molluscabase = '820077'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Achatina_achatina}}';
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
bibkey = 'Hoda1982'; type = 'Article'; bib = [ ... 
'author = {Hodasi, J. K. M.}, ' ... 
'year = {1982}, ' ...
'title = {The effects of different light regimes on the behaviour biology of \emph{Achatina (Achatina) achatina} ({L}inne).}, ' ...
'journal = {J. Molluscan Stud.}, ' ...
'volume = {48}, ' ...
'pages = {283--293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'petsnails'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.petsnails.co.uk/species/achatina-achatina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlukAdis2014'; type = 'Article'; bib = [ ... 
'author = {F. A.  Aluko and A. A. Adisa and B. B. A. Taiwo and A. M. Ogungbesan and H. A. Awojobi}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{http://www.usa-journals.com/wp-content/uploads/2014/04/Aluko_Vol25.pdf}}, ' ...
'title = {QUANTITATIVE MEASUREMENTS OF TWO BREEDS OF SNAIL}, ' ...
'journal = {American Journal of Research Communication}, ' ... 
'volume = {2}, ' ...
'pages = {175}'];metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

