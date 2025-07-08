function [data, auxData, metaData, txtData, weights] = mydata_Callianira_antarctica

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Tentaculata'; 
metaData.order      = 'Cydippida'; 
metaData.family     = 'Mertensiidae';
metaData.species    = 'Callianira_antarctica'; 
metaData.species_en = 'Antarctic comb jelly'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.5); % K, body temp
metaData.data_0     = {'ap'; 'am';'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'L-Wd'; 'L-WC'; 'L-WN'; 'Wd-JO'; 'Wd-JN'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2012 12 19];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2013 06 20];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   


metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2 = [2015 11 03];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.author_mod_3   = {'Bas Kooijman'};        
metaData.date_mod_3 = [2019 08 18];                           
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_3  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 18]; 

%% set data
% zero-variate data

data.tp = 200;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(-1.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(-1.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'guess';
data.Li  = 9.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ScolDaly2006';

data.Wwb = 1.8e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter 700 mum: pi/6*0.07^3';
data.Wdi = 1.366; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'ScolDaly2006';


% uni-variate data

% weight-respiration
data.WdJO = [ ...	dry mass. mg	mu l O2/hr	
	2.831	0.384	;	24.615	4.335	;	38.576	10.644	;	71.093	11.217	;	105.821	16.348	;	114.796	14.939	;
	170.921	28.01	;	172.854	72.671	;	569.516	94.885	;	1027.882	62.639	];
units.WdJO   = {'mg', 'mul O2/h'};  label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO    = C2K(-0.5);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'ScolDaly2006';
%
% weight-excretion
data.WdJN = [ ...	dry mass. mg	mu mol N/hr	
	2.752	0.006	;	24.272	0.019	;	37.91	0.042	;	69.724	0.082	;	104.903	0.059	;	113.54	0.133	;
	167.474	0.079	;	171.004	0.068	;	566.676	0.274	;	1028.783	0.044	];
units.WdJN   = {'mg', 'mumol N/h'};  label.WdJN = {'dry weight', 'NH_3 excretion'};  
temp.WdJN    = C2K(-0.5);  units.temp.WdJN = 'K'; label.temp.WdJN = 'temperature';
bibkey.WdJN = 'ScolDaly2006';

% length-weight
LWdCN = [ ...TL (mm)	DW (mg)	Total C (mg)	Total N (mg)
59.8	366.5	32.04	6.82
35  	202.3	22.57	4.82
47.9	279.1	21.30	5.13
77.6	488.8	36.33	7.56
45  	272.7	22.54	5.19
83.6	757.6	90.96	17.58
39.6	169.5	13.23	3.31
37.2	149.9	10.49	2.53
10  	8.1	0.49	0.13
16  	12.5	1.21	0.31
17  	18.8	2.31	0.24
20  	49.9	4.67	0.70
12.5	4.9	0.07	0.01
21  	25.8	3.16	0.56
40  	174.2	24.08	4.98
43  	264.0	29.70	6.37
14  	14.6	1.87	0.26
38  	173.0	14.74	3.52
23  	38.7	3.53	0.87
50  	206.2	33.21	7.85
22  	46.5	3.77	0.94
23  	82.7	3.99	0.86
85  	1049.1	130.72	29.44
73  	598.6	60.28	13.55
8.5  	2.8	0.05	0.01
22  	24.6	1.45	0.35
28  	70.5	4.48	1.19
34  	107.5	5.60	1.54
28  	115.2	12.06	3.12
98  	1365.6	340.21	60.44
28  	101.7	6.49	1.50
61  	564.0	82.09	18.17];
data.LWd = LWdCN(:,[1 2]); 
units.LWd   = {'mm', 'mg'};  label.LWd = {'total length', 'dry weight'};  
bibkey.LWd = 'ScolDaly2006';
comment.LWd = 'Raw data from the study provided in personal communication 11 june 2013';
%
data.LWC = LWdCN(:,[1 3]); 
units.LWC   = {'mm', 'mg'};  label.LWC = {'total length', 'total C weight'};  
bibkey.LWC = 'ScolDaly2006';
comment.LWC = 'Raw data from the study provided in personal communication 11 june 2013';
%
data.LWN = LWdCN(:,[1 4]);
units.LWN   = {'mm', 'mg'};  label.LWN = {'total length', 'total N weight'};  
bibkey.LWN = 'ScolDaly2006';
comment.LWN = 'Raw data from the study provided in personal communication 11 june 2013';
  
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

%% Discussion points
D1 = 'Chemical pars are assumped to relate to ash-free dry mass; MaleFaga1993 report ash free dry mass over dry mass ratio of 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
D2 = 'mod_3: guessed data added to allow parameter estimation; kappa fixed at 0.95 in absence of reproduction data';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'C. antarctica feeds mainly on copepods';
metaData.bibkey.F1 = 'SeJoScol2004'; 
F2 = 'Is found is Magellan Strait and the Antarctic Ocean; C. antarctica egested little else than clear pieces of disarticulated exoskeleton';
metaData.bibkey.F2 = 'ScolDaly2006'; 
F3 = 'The similarity in feeding incidence between autumn and winter, despite a large seasonal variability in prey abundance, suggests that other factors, such as prey patchiness, may significantly influence feeding';
metaData.bibkey.F3 = 'ScolDaly2006';
F4 = 'Hermaphrodite';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'PM4M'; % Cat of Life
metaData.links.id_ITIS = '659786'; % ITIS
metaData.links.id_EoL = '45502494'; % Ency of Life
metaData.links.id_Wiki = 'Callianira_(ctenophore)'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '290691'; % Taxonomicon
metaData.links.id_WoRMS = '265170'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callianira_antarctica}}';
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
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplantkton.}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScolDaly2006'; type = 'Article'; bib = [ ... 
'author = {Scolardi, K. M. and Daly, K. and Pakhomov, E. A. and Torres, J. J.}, ' ... 
'year = {2006}, ' ...
'title = {Feeding ecology and metabolism of the {A}ntarctic cydippid ctenophore \emph{Callianira antarctica}}, ' ...
'journal = {Marine Ecological Progress Series}, ' ...
'howpublished = {\url{http://www.int-res.com/articles/meps2006/317/m317p111.pdf}}, '  ...
'volume = {317}, ' ...
'pages = {111-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeJoScol2004'; type = 'Article'; bib = [ ... 
'author = {Se-Jong, J. and Scolardi, K. M. and Daly, K. and Harvey, H. R.}, ' ... 
'year = {2004}, ' ...
'title = {Understanding the trophic role of the {A}ntarctic ctenophore \emph{Callianira antarctica}, using lipid biomarkers}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {27}, ' ...
'pages = {782--792}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WORMS'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marinespecies.org/aphia.php?p=taxdetails&id=265170}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

