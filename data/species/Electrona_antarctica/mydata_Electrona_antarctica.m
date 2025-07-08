function [data, auxData, metaData, txtData, weights] = mydata_Electrona_antarctica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Electrona_antarctica'; 
metaData.species_en = 'Antarctic lanternfish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.4); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'}; 
metaData.date_subm = [2019 01 23]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.tj = 38; units.tj = 'd';    label.tj = 'time since birth at metam';  bibkey.tj = 'GreeGart1999';  
  temp.tj = C2K(0.4); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '30 to 47 d';
data.am = 3.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GreeGart1999';  
  temp.am = C2K(0.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.4;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'fishbase';
data.Li = 11.5;   units.Li = 'cm';   label.Li = 'ultimate standard length for females';    bibkey.Li = 'fishbase';
data.Lim = 10.3;   units.Lim = 'cm';   label.Lim = 'ultimate standard length for males';    bibkey.Lim = 'fishbase';
  comment.Lim = 'fishbase actually specifies Li and Lim interchanged, but GreeGart1999 state that females become bigger';

data.Wwb = 2.7e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3; Wiki gives this in the article on Electrona';
data.Wwi = 20.9; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.01000*Li^3.13';
data.Wwim = 14.8; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';  
  comment.Wwim = 'based on 0.01000*Lim^3.13';

data.Ri = 7e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(0.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr),standard length
551.595	4.465
577.547	4.540
636.745	4.844
653.350	4.977
696.066	5.014
786.544	5.659
834.430	6.134
851.018	6.286
893.646	6.418
947.249	6.741
1002.694	7.082
1050.562	7.576
1079.914	7.994
1095.084	7.671
1109.389	8.279
1174.322	8.411
1223.801	9.171
1286.557	9.645
1293.851	9.797
1356.607	10.272];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(0.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GreeGart1999';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), standard length (cm)
421.889	4.029
464.852	3.800
592.541	4.407
686.507	5.299
856.894	5.963
999.259	6.778
1062.351	6.892
1178.587	7.822
1190.022	7.517
1228.491	8.125
1254.319	8.334];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(0.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GreeGart1999';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 0.4 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-Weight relationship: W in g = 0.01000*(SL in cm)^3.13';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6F2YD'; % Cat of Life
metaData.links.id_ITIS = '623809'; % ITIS
metaData.links.id_EoL = '46564135'; % Ency of Life
metaData.links.id_Wiki = 'Electrona_antarctica'; % Wikipedia
metaData.links.id_ADW = 'Electrona_antarctica'; % ADW
metaData.links.id_Taxo = '173594'; % Taxonomicon
metaData.links.id_WoRMS = '217697'; % WoRMS
metaData.links.id_fishbase = 'Electrona-antarctica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Electrona_antarctica}}';
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
bibkey = 'GreeGart1999'; type = 'article'; bib = [ ...
'author = {T. M. Greely and J. V. Gartner  and  J. J. Torres}, ' ... 
'year   = {1999}, ' ...
'title  = {Age and growth of \emph{Electrona antarctica} ({P}isces: {M}yctophidae), the dominant mesopelagic fish of the {S}outhern {O}cean}, ' ...
'journal = {Marine Biology}, ' ...
'page = {145-158}, ' ...
'volume = {133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Electrona-antarctica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

