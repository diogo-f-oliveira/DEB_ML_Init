function [data, auxData, metaData, txtData, weights] = mydata_Pycnogonum_litorale

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Pycnogonida'; 
metaData.order      = 'Pantapoda'; 
metaData.family     = 'Pycnogonidae';
metaData.species    = 'Pycnogonum_litorale'; 
metaData.species_en = 'Sea spider'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCia'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.ab = 32;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'TomaWilh1997';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '32 - 81 d, max 111 d';
data.tj = 83;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'TomaWilh1997';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '66 - 113 d after birth';
data.tp = 290;    units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'TomaWilh1997';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365 ; units.am = 'd';   label.am = 'life span';                bibkey.am = 'TomaWilh1997';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.012; units.L0  = 'cm'; label.L0  = 'egg diameter ';           bibkey.L0  = 'TomaWilh1997';
data.Lb  = 0.015; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'TomaWilh1997';
data.Lj  = 0.071; units.Lj  = 'cm'; label.Lj  = 'total length at metam';   bibkey.Lj  = 'TomaWilh1997';
  comment.Lj = '5th larval instar';
data.Lp  = 0.82;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TomaWilh1997';
  comment.Lp = 'pre-adult at 8th juvenile instar';
data.Li  = 1.01;  units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'TomaWilh1997';
  comment.Li = 'for females: 0.85-1.1 cm';

data.Wwi = 0.077; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'very roughly estimated from stylised picture: disc of diam 0.7 cm and height 0.2 cm: pi * 0.35^2 * .2';

data.Ri  = 5.5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['roughly estimated from photo: volume of eggs as carried by male about equal to own volume: 0.05 cm^3. '...
      'Volume of 1 egg: pi 4/3 (L0/2)^3 = 9.05e-7 cm^3. So 0.05/9.05e-7 = 5.5e4 eggs per mass, one mass per yr'];
  
% uni-variate data
% time-length
data.tL = [ ... % time since july 1 (d), body length (mm)
18.55146125	1.19630564
29.21855146	1.28716645 
31.53748412	1.55610764 % moult II
39.42185515	1.58692560
41.74078780	1.69168769
46.37865311	1.69225663
46.37865312	1.69225663 % moult III
46.84243964	2.03559711
51.01651842	2.03610916
59.36467598	2.06698401
65.39390089	2.08264902
69.56797967	2.06829259
70.03176620	2.30704167 % moult IV
75.13341804	2.33757515
83.94536213	2.41328301
93.68487929	2.50403004
98.78653113	2.56435737
105.27954257	2.71440763
112.70012706	2.64069108 
116.87420584	2.73075537
116.87420585	3.19344194 % moult V
132.64294790	3.67298830
145.62897078	3.65965598
147.02033037	4.07773711
162.32528590	4.54230120
171.13722999	4.49860608
178.55781449	4.66369550
188.29733164	4.60518880
200.81956798	4.78582943 % moult VI
202.21092757	5.15913444
205.45743329	5.45804017
212.87801779	5.45895048 
221.68996188	5.81824044
231.42947903	5.77465911
243.02414231	5.67160386
254.15501906	5.68789471
262.96696315	5.73375183
275.02541296	5.82478333
281.51842440	5.87035597
290.33036849	5.90128772
290.33036850	6.72218324 % moult VII, adult
294.50444727	6.85702365
302.38881830	7.52963265
317.22998729	7.38219955
328.82465057	7.68212938];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % set first observation time to 0
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TomaWilh1997';
comment.tL = 'Data for male';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'grasp hydranths of Clava multicornis (Hydractiniidae) as larvae and feed on their stolons';
metaData.bibkey.F1 = 'TomaWilh1997'; 
F2 = 'loose larval extremities at 5th moult and change feeding from small hydroids to sea anemones';
metaData.bibkey.F2 = 'TomaWilh1997'; 
F3 = 'number of juvenile moults varies between 6 and 8';
metaData.bibkey.F3 = 'TomaWilh1997'; 
F4 = 'juvenile also increase in length during intermoult; First increase can be due to uptake of water';
metaData.bibkey.F4 = 'TomaWilh1997'; 
F5 = 'males carry the eggs on their ovigers till protonymphon larvae hatch';
metaData.bibkey.F5 = 'TomaWilh1997'; 
F6 = 'prefers Metridium senile as food above Actinia equina and Tealia felina in British waters';
metaData.bibkey.F6 = 'TomaWilh1997'; 
F7 = 'repeated mating as adults without further moults';
metaData.bibkey.F7 = 'TomaWilh1997'; 
F8 = 'can starve for 18 months';
metaData.bibkey.F8 = 'TomaWilh1997'; 
F9 = 'females deposit all their eggs in a single clutch on the male';
metaData.bibkey.F9 = 'JarvKing1972'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7,'F8',F8,'F9',F9);

%% Links
metaData.links.id_CoL = '4QMGB'; % Cat of Life
metaData.links.id_ITIS = '1138632'; % ITIS
metaData.links.id_EoL = '46543649'; % Ency of Life
metaData.links.id_Wiki = 'Pycnogonum'; % Wikipedia
metaData.links.id_ADW = 'Pycnogonum_littorale'; % ADW
metaData.links.id_Taxo = '5630462'; % Taxonomicon
metaData.links.id_WoRMS = '239867'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pycnogonum}}';
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
bibkey = 'JarvKing1972'; type = 'Article'; bib = [ ... 
'author = {Jarvis, J. H. and King, P. E.}, ' ... 
'year = {1972}, ' ...
'title = {Reproduction and development in the pycnogonid \emph{Pycnogonum littorale}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {13}, ' ...
'pages = {146--154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TomaWilh1997'; type = 'Article'; bib = [ ... 
'author = {K.-H. Tomaschko and E. Wilhelm and D. Buckmann}, ' ... 
'year = {1997}, ' ...
'title = {Growth and reproduction of \emph{Pycnogonum litorale} ({P}ycnogonida) under laboratory conditions}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {129}, ' ...
'pages = {595-600}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

