function [data, auxData, metaData, txtData, weights] = mydata_Austrominius_modestus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Sessilia'; 
metaData.family     = 'Austrobalanidae';
metaData.species    = 'Austrominius_modestus'; 
metaData.species_en = 'New Zealand barnacle'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdj'; 'Wdi'; 'Wwi'; 'Ej'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Wd_T'; 't-E_T'; 't-JO_T'}; 

metaData.COMPLETE   = 2.7; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 05 04];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 05 04]; 

%% set data
% zero-variate data

data.tj = 10.6;      units.tj = 'd';      label.tj = 'time since birth at settlement';        bibkey.tj = 'Herm1987';   
  temp.tj = C2K(18); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'nauplius stages 8.6d, cypris stage 2 d (assumed)';
data.tp = 39;         units.tp = 'd';      label.tp = 'time since settlement at puberty';      bibkey.tp = 'CrisPate1961';   
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'fully submerged';
data.am = 1.4*365;   units.am = 'd';      label.am = 'life span';                             bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.6;    units.Lp  = 'cm';    label.Lp  = 'basal diameter at puberty';              bibkey.Lp  = 'CrisPate1961';
data.Li  = 1.4;    units.Li  = 'cm';     label.Li  = 'ultimate basal diameter';               bibkey.Li  = 'CrisPate1961';

data.Wwb = 9e-7;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                     bibkey.Wwb = 'CrisPate1961';
  comment.Wwb = 'Based on egg diameter of 120 mum: pi/6*0.012^3';
data.Wdj = 5.81e-6; units.Wdj = 'g';   label.Wdj = 'dry weight at settlement';                bibkey.Wdj = 'Herm1987';
data.Wdi = 0.033;   units.Wdi = 'g';   label.Wdi = 'ultimate soma dry weight at L = 1.35 cm'; bibkey.Wdi = 'CrisPate1961';
data.Wwi = 0.137;   units.Wwi = 'g';   label.Wwi = 'ultimate soma wet weight at L = 1.35 cm'; bibkey.Wwi = 'CrisPate1961';

data.Ej  = 0.1425;  units.Ej  = 'J';    label.Ej  = 'energy content at settlement';           bibkey.Ej  = 'Herm1987';

data.Ri  = 2.22e3/14;  units.Ri  = '#/d';   label.Ri  = 'reprod rate at 13.5 mm basal diameter';  bibkey.Ri  = 'CrisPate1961';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 mg per brood, 2e-3/9e-7=2.22e3 eggs/brood; 1 broods per 14 d';

% uni-variate data
% time-weight data
data.tW12 = [ ... % time (d), dry weight (mug)
1.259	0.39
4.051	0.71
6.304	1.20
9.086	2.33
13.471	4.27];
units.tW12   = {'d', 'mug'};  label.tW12 = {'time', 'dry weight', '12 C'};  
temp.tW12    = C2K(12);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'Herm1987';
%
data.tW18 = [ ... % time (d), dry weight (mug)
1.008	0.41   % II
2.581	0.75   % III
3.797	1.47   % IV
5.656	2.62   % V
8.658	5.19]; % VI
units.tW18   = {'d', 'mug'};  label.tW18 = {'time', 'dry weight', '18 C'};  
temp.tW18    = C2K(18);  units.temp.tW18 = 'K'; label.temp.tW18 = 'temperature';
bibkey.tW18 = 'Herm1987';
%
data.tW24 = [ ... % time (d), dry weight (mug)
0.640	0.39
1.671	0.79
2.540	1.06
3.649	2.45
5.315	4.39];
units.tW24   = {'d', 'mug'};  label.tW24 = {'time', 'dry weight', '24 C'};  
temp.tW24    = C2K(24);  units.temp.tW24 = 'K'; label.temp.tW24 = 'temperature';
bibkey.tW24 = 'Herm1987';

% time-energy data
data.tE12 = [ ... % time (d), energy content (mJ)
1.259	5.72
4.051	10.99
6.304	19.61
9.086	31.03
13.471	64.88];
units.tE12   = {'d', 'mJ'};  label.tE12 = {'time', 'energy content', '12 C'};  
temp.tE12    = C2K(12);  units.temp.tE12 = 'K'; label.temp.tE12 = 'temperature';
bibkey.tE12 = 'Herm1987';
%
data.tE18 = [ ... % time (d), energy content (mJ)
1.008	6.30    % II
2.581	11.28   % III
3.797	19.34   % IV
5.656	38.62   % V
8.658	89.10]; % VI
units.tE18   = {'d', 'mJ'};  label.tE18 = {'time', 'energy content', '18 C'};  
temp.tE18    = C2K(18);  units.temp.tE18 = 'K'; label.temp.tE18 = 'temperature';
bibkey.tE18 = 'Herm1987';
%
data.tE24 = [ ...
0.640	7.28
1.671	14.13
2.540	15.82
3.649	35.69
5.315	90.20];
units.tE24   = {'d', 'mJ'};  label.tE24 = {'time', 'energy content', '24 C'};  
temp.tE24    = C2K(24);  units.temp.tE24 = 'K'; label.temp.tE24 = 'temperature';
bibkey.tE24 = 'Herm1987';

% time-respiration data
data.tJO12 = [ ...
1.259	1.321
4.051	2.306
6.304	4.167
9.086	7.591
13.471	11.361];
units.tJO12   = {'d', 'ng/h'};  label.tJO12 = {'time', 'O_2 consumption', '12 C'};  
temp.tJO12    = C2K(12);  units.temp.tJO12 = 'K'; label.temp.tJO12 = 'temperature';
bibkey.tJO12 = 'Herm1987';
%
data.tJO18 = [ ...
1.008	3.272    % II
2.581	5.130    % III
3.797	10.842   % IV
5.656	14.214   % V
8.658	17.248]; % VI
units.tJO18   = {'d', 'ng/h'};  label.tJO18 = {'time', 'O_2 consumption', '18 C'};  
temp.tJO18    = C2K(18);  units.temp.tJO18 = 'K'; label.temp.tJO18 = 'temperature';
bibkey.tJO18 = 'Herm1987';
%
data.tJO24 = [ ...
0.640	4.051
1.671	7.713
2.540	15.130
3.649	23.329
5.315	26.310];
units.tJO24   = {'d', 'ng/h'};  label.tJO24 = {'time', 'O_2 consumption', '24 C'};  
temp.tJO24    = C2K(24);  units.temp.tJO24 = 'K'; label.temp.tJO24 = 'temperature';
bibkey.tJO24 = 'Herm1987';


% tL-data
data.tL = [  ... % time since settlement (d), basal diameter (cm)
14.870	0.228
22.874	0.367
38.890	0.603
52.244	0.765
67.131	0.904
86.987	1.058
100.734	1.159
128.247	1.266
156.919	1.316
203.181	1.366];
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'basal diameter'};  
temp.tL    = [ ... % time since settlement (d), temperature (C)
3.907	13.374
6.996	14.526
16.571	15.098
26.935	16.632
36.488	16.339
45.685	17.104
56.390	17.002
66.350	17.671
76.282	17.281
86.992	17.372
96.185	17.945
106.105	17.075
116.023	16.108
126.333	15.526
136.614	13.791
145.390	13.017
155.634	9.839
165.939	9.065
177.012	8.387
186.180	7.998
196.100	7.127
206.422	7.026];  
units.temp.tL = 'C'; label.temp.tL = 'temperature';
bibkey.tL = 'CrisPate1961';
comment.tL = 'Basal diameter is measured along the rostro-carinal axis for singletons';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.Lp = 5 * weights.Lp;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW24','tW18','tW12'}; subtitle1 = {'Data at 24, 18, 12 C'};
set2 = {'tE24','tE18','tE12'}; subtitle2 = {'Data at 24, 18, 12 C'};
set3 = {'tJO24','tJO18','tJO12'}; subtitle3 = {'Data at 24, 18, 12 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'kap_R is set at 0.95/2, since the species is hermaphroditic';                                                
D2 = 'tL data indicate that shape is changing during post metam growth, which is implemented';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hermaphroditic, but requires cross fertilisation, 6 nauplius stages, 1 non-feeding cyprid stage; broods each 2 weeks; puberty in first season';
metaData.bibkey.F1 = {'nederlandsesoorten','Herm1987'}; 
F2 = 'First nauplius stage does not feed and lasts a few hours; the cyprid stage lasts 2 d';
metaData.bibkey.F2 = 'Herm1987'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '206264'; % ITIS
metaData.links.id_EoL = '53728241'; % Ency of Life
metaData.links.id_Wiki = 'Austrominius_modestus'; % Wikipedia
metaData.links.id_ADW = 'Elminius_modestus'; % ADW
metaData.links.id_Taxo = '4481866'; % Taxonomicon
metaData.links.id_WoRMS = '712167'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Austrominius_modestus}}';
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
bibkey = 'Herm1987'; type = 'Article'; bib = [ ... 
'author = {J. Harms}, ' ... 
'year = {1987}, ' ...
'title = {Energy budget for the larval development of \emph{Elminius modestus} ({C}rustacea: {C}irripedia)}, ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {41}, ' ...
'pages = {45--67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrisPate1961'; type = 'Article'; bib = [ ... 
'author = {D. J. Crisp and Bhupendra Pate}, ' ... 
'year = {1961}, ' ...
'title = {THE INTERACTION BETWEEN BREEDING AND GROWTH RATE IN THE BARNACLE \emph{Elminius modestus} {D}ARWIN}, ' ...
'journal = {Limnology and Oceanogrpahy}, ' ...
'volume = {6}, ' ...
'pages = {105--1015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nederlandsesoorten'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nederlandsesoorten.nl/linnaeus_ng/app/views/species/nsr_taxon.php?id=144207&cat=&epi=1}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

