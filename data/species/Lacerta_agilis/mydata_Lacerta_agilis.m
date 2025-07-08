function [data, auxData, metaData, txtData, weights] = mydata_Lacerta_agilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Lacerta_agilis'; 
metaData.species_en = 'Sand lizard'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 't-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Peter Vermeiren'; 'Cynthia C Munoz'};  
metaData.date_subm = [2024 02 16];              
metaData.email    = {'peter.vermeiren@gmail.com'};            
metaData.address  = {'Rifcon GmbH'};   

metaData.curator     = {'Bas Kooijman'}; 
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 02 18];

%% set data
% zero-variate data

data.ab = 50;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'CuiYang2022';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'OlssShin1996';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.1;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess';
  comment.Lb = 'based on Lacerta_agilis_boemica';
data.Li  = 8.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'OlssShin1996';  
data.Lim  = 7.9; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'OlssShin1996';  

data.Wwp = 7;   units.Wwp = 'g';  label.Wwp = 'wet at puberty'; bibkey.Wwp = 'Anon2017';
 comment.Wwp = '6-8 g';
data.Wwi = 12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'arkive';

% univariate data
% time-length-weight
data.tLW = [ ... % time (months), South-vent-length (mm), wet-weight(g), clutch size (#)
80	84	NaN 8
NaN	77	NaN 8
NaN	NaN	NaN 8
56	85	NaN 10
80	86	NaN 9
22	74	NaN 7
NaN	78	NaN 7
56	83	NaN 10
92	87	NaN 10
80	88	NaN 9
44	77	NaN 7
80	85	NaN 11
NaN	79	NaN 8
116	89	NaN 8
80	81	NaN 8
92	85	NaN 11
NaN	77	NaN 9
44	78	NaN 9
80	81	NaN 10
80	87	NaN 11
56	81	NaN 8
44	80	NaN 4
80	86	14.83   8
80	88	18.34   12
44	80	14.2    8
44	88	16.7    9
104	86	16.24   12
80	82	15.73   11
68	80	12.26   6
68.5	79	12.5    9
NaN	85	16.03   11
43	70	10.02   8
80	88	17.84   11
56	84	15.64   9
NaN	73	9.85    6
68	80	14.3    10
92	83	13.1    10
56	88	16.3    13
NaN	84	14.34   10
32	67	10.42   7
91	91	17.6    11
68	84	18.39   10
43	79	13.6    10
NaN	72	11.33   7
68	78	12.37   7
56.5	80	14.3    9
56	80	12.32   8
44	80	12.52   8
32	80	13.82   9
56.5	74	10.68   7
56	82	14  10
69	85	14.81   9
43	87	14.52   14
56	78	12.17   6
56.5	81	14.02   7
92	83	11.8    8
117	82	12.3    9
43	75	9.73    6
33	73	9.99    6
57	NaN	20.46   5
44.5	81	17.18   6
20.5	61	7.45    6
21	65	6.53    5
32	70	11.81   8
33	73	9.77    4
44.5	74	10  6
46	81	12.3    8
45	85	13.8    10
56	86	14.8    10
44	80	14.1    9
44	88	14.5    10
44.5	83	13.6    11
81	83	13  9
57	84	13.3    7
92	89	17  11
68	84	15.6    10
44	84	15.2    6
92	87	15.3    10
56.5	81	15.8 6
56.5	85	16.8 11
56	86	13.8    7
57	86	16.7    11
44	83	16.7    9
44	79	14.6    7
56	82	14.8    8
56	82	12.4    7
44	78	10.3    5
68	86	14.1    8
57.5	78	9.9 6
56	81	13.2    6
56	87	15  6
44	81	13  8
56	85	20.1    11
68	87	18.1    11
56	80	13.3    7
80	84	14.4    10
68	86	16.2    8
32	88	15.2    8
56	82	14.3    9
69	83	14.2    8
56.5	78	11.8    8
81	84	13.2    6
57	81	12.1    8
32.5	81	15.9    10
69	87	15.3    8
45	77	13.8    5
44	78	16.6    7
57	83	16.3    10
33	78	14.6    8
45	79	14.2    7
70.5	89	15.1    8
69	84	14.8    8
43	76	13.6    8
45	81	13.8    7
69	81	15  7
44	83	13.6    8
44.5	71	10.5    5
33	75	13.4    7
93	86	17.6    8
56	83	15.8    7
45	80	12.8    8
33	75	11.8    8
45	75	13.3    8
45	81	13.2    6
33	72	10  6
57	87	17.6    11
33	75	11.1    7
32.5	82	13.8    8
56	83	NaN 9
45.5	82	13  9
57.5	88	15.8    11
21.5	81	12  8
68.5	92	19.8    6
44	79	13.5    8
NaN	NaN	17  11
57	83	11.2    7
NaN	NaN	16  7
46	87	17  12
71	94	17.2    10
44	82	13.8    8
46	87	18.2    10
44	83	12.1    8
NaN	85	13.8    8
33.5	79	10.8    8
45	77	11.8    7
57.5	77	11.8    6
32	76	11.8    6
33	78	11.8    7
35	82	12.2    8
NaN	NaN	10.2    6
NaN	NaN	11.8    8
81	89	18.5    9
58	87	14.2    10
44	83	17.2    9];
data.tLW(:,1) = data.tLW(:,1)/12*365-50; % convert month to d 
data.tLW = data.tLW(~isnan(data.tLW(:,1)),:); % remove times with NaN
[t, ind]=sort(data.tLW(:,1)); data.tLW = data.tLW(ind,:); % sort time
for i=2:size(data.tLW,1); if data.tLW(i,1)<=data.tLW(i-1,1); data.tLW(i,1)=data.tLW(i-1,1)+1e-8;end;end 
data.tLW(:,2) = data.tLW(:,2)/10; % convert mm to cm
data.tN = data.tLW(:,[1 4]);  data.tLW(:,4) = [];
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'snout-vent length', 'wet weight'};
temp.tLW   = C2K(23.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Verm2023'; 
treat.tLW = {1, {'snout-vent length','wet weight'}}; 
comment.tLW = 'Temp is estimated body temperature, after fitting a regression to AmatLlio2003; time is correction for incubation time: 50 days at 24C, CuiYang2022, Fig 3a';
%
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'yearly fecundity'};
temp.tN   = C2K(23.5);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Verm2023'; 
comment.tN = 'Temp is estimated body temperature, after fitting a regression to AmatLlio2003';
%
data.tL_fm = [ ... time since birth (yr), SVL (cm), females, males
 2	4.837 4.592
 3	6.597 6.390
 4	7.659 6.960
 5	8.048 7.375
 6	8.359 7.674
 7	8.555 7.934
 8	8.595 7.870
 9	8.673 8.065
10	8.791 8.015
11	8.572 8.132
12	8.431 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1)*365; % convert yr to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'snout-vent length'};
temp.tL_fm   = C2K(23.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OlssShin1996'; treat.tL_fm = {1, {'female','male'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6NRCH'; % Cat of Life
metaData.links.id_ITIS = '1155305'; % ITIS
metaData.links.id_EoL = '791768'; % Ency of Life
metaData.links.id_Wiki = 'Lacerta_agilis'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_agilis'; % ADW
metaData.links.id_Taxo = '642580'; % Taxonomicon
metaData.links.id_WoRMS = '1506598'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Lacerta&species=agilis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lacerta_agilis}}';
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
bibkey = 'Verm2023'; type = 'Misc'; bib = [ ...
'author = {Peter Vermeiren}, ' ...
'year = {2023}, ' ...
'note = {Data received from Mats Olsson in 2023, related to OlssShin1996}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlssShin1996'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00328543}, ' ...
'author = {Olsson, M. and Shine, R.}, ' ... 
'year = {1996}, ' ...
'title = {Does reproductive success increase with age or with size in species with indeterminate growth? {A} case study using sand lizards \emph{Lacerta agilis}}, ' ...
'journal = {Oecologia}, ' ...
'volume = {105}, ' ...
'pages = {175-178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BlanFear2015'; type = 'Book'; bib = [ ...  
'author = {Blanke, I. and Fearnley, H.}, ' ...
'year = {2015}, ' ...
'title  = {The sand lizard, between light and shadow}, ' ...
'publisher = {Laurenti Verlag}, ' ...
'pages = {1-77}, ' ...
'howpublished = {\url{https://shop.laurenti.de/product_info.php?products_id=926}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CuiYang2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fevo.2022.845309}, ' ...
'author = {Luoxin Cui and Cheng Yang and Decheng Zhang and Shu Lin and Wenge Zhao and Peng Liu}, ' ... 
'year = {2022}, ' ...
'title = {Beneficial effects of warming temperatures on embryonic and hatchling development in a low-latitude margin population of the high-latitude lizard \emph{Lacerta agilis}}, ' ...
'journal = {Frontiers in Ecology and Evolution}, ' ...
'volume = {10}, ' ...
'pages = {845309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmatLlio2003'; type = 'Article'; bib = [ ... 
'author = {F\`{e}lix Amat and Gustavo A. Llorente and Miguel A. Carrero}, ' ... 
'year = {2003}, ' ...
'title = {A preliminary study on thermal ecology, activity times and microhabitat use of \emph{Lacerta agilis} ({S}quamata: {L}acertidae) in the {P}yrenees}, ' ...
'journal = {Folia Zool.}, ' ...
'volume = {52(4)}, ' ...
'pages = {413–422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Anon2017'; type = 'techreport'; bib = [ ... 
'author = {Anonymous}, ' ... 
'year = {2017}, ' ...
'title = {Kennisdocument Zandhagedis, versie 1.0}, ' ...
'institution = {Folia Zool.}, ' ...
'howpublished = {\url{https://www.bij12.nl/wp-content/uploads/2023/11/Kennisdocument-Zandhagedis.pdf}}, ' ...
'volume = {BIJ12-2017-02}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

