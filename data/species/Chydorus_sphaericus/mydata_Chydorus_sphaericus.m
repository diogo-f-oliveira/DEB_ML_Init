function [data, auxData, metaData, txtData, weights] = mydata_Chydorus_sphaericus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Chydorus_sphaericus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 'T-ab'; 'L-Wd'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 11 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 


%% set data
% zero-variate data

data.tp = 18;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'Vijv1980';   
  temp.tp = C2K(5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'Read from tL-data for Lp';
data.am = 90;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.019; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Vijv1980';
data.Lp  = 0.033; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.05;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Vijv1980';
  
data.Ri  = 0.33;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Vijv1980';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Derived from Tab data';
  
% uni-variate data
% time-length
data.tL_2 = [ ... % time since birth (d), length (mm)
7.508	0.228
14.329	0.261
21.277	0.291
28.354	0.314
35.432	0.334
42.257	0.353
49.338	0.354
56.292	0.360
63.374	0.361
70.327	0.367
77.282	0.367
84.236	0.371
91.318	0.369
98.399	0.370];
data.tL_2(:,2) = data.tL_2(:,2)/ 10; % convert mm to cm
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time since birth', 'length', '2.5 C'};  
temp.tL_2    = C2K(2.5);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = 'Vijv1980';
%
data.tL_5 = [ ... % time since birth (d), length (mm)
0.185	0.187
7.498	0.273
14.191	0.317
21.141	0.345
28.218	0.370
35.172	0.379
42.250	0.404
49.077	0.414
56.284	0.418
63.364	0.425
70.444	0.432
77.399	0.436
84.226	0.444
91.305	0.458
98.259	0.466];
data.tL_5(:,2) = data.tL_5(:,2)/ 10; % convert mm to cm
units.tL_5   = {'d', 'cm'};  label.tL_5 = {'time since birth', 'length', '5 C'};  
temp.tL_5    = C2K(5);  units.temp.tL_5 = 'K'; label.temp.tL_5 = 'temperature';
bibkey.tL_5 = 'Vijv1980';

% temperature-age at birth
itt = [32.98757047 -3.394823128; 
       33.54588165 -3.730757037;
       34.12264786 -4.057620684;
       34.71175126 -4.481983805;
       35.32530648 -4.916139778];
data.Tab = [1e4./itt(:,1) - 273, exp(-itt(:,2))/24]; % K, d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Kooy2010';
comment.Tab = 'Fig 1.6, data from Meye1984';

% temperature-age at birth
data.Tab = [ ... % temperature (C), number of brood per week
 2.5 0.2
 5   0.4
10   1.2
15   2.0
20   2.3
25   2.7];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d and ab = 1/N
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% length-weight
LW = [ ... % ln length (ln mum), ln dry weight (ln ng)
5.612	2.068
5.681	2.293
5.682	2.702
5.686	3.080
5.720	3.256
5.721	2.708
5.743	2.482
5.746	3.329
5.748	3.049
5.754	2.762
5.784	3.000
5.784	3.128
5.810	3.042
5.837	3.329
5.893	3.432];
data.LW = exp(LW); 
data.LW(:,1) = data.LW(:,1) * 1e-4; % convert to cm
units.LW   = {'cm', 'ng'};  label.LW = {'length', 'dry weight'};  
bibkey.LW = 'NandSarm2005';
comment.LW = 'authors actually specify weight in mug, but my working hypothesis is that mug must be ng';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_2 = 50 * weights.tL_2;
weights.tL_5 = 50 * weights.tL_5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_5','tL_2'}; subtitle1 = {'Data for 5, 2 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'V488'; % Cat of Life
metaData.links.id_ITIS = '83993'; % ITIS
metaData.links.id_EoL = '46498226'; % Ency of Life
metaData.links.id_Wiki = 'Chydorus'; % Wikipedia
metaData.links.id_ADW = 'Chydorus_sphaericus'; % ADW
metaData.links.id_Taxo = '33122'; % Taxonomicon
metaData.links.id_WoRMS = '148406'; % WoRMS


%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Chydorus~sphaericus.pdf}}';
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
bibkey = 'Vijv1980'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J.}, ' ... 
'year = {1980}, ' ...
'title = {Effect if temperature in laboratory studies on the development and growth of Cladocera and copepoda from {T}jeukemeer, the {N}etherlands}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {10}, ' ...
'pages = {317-340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NandSarm2005'; type = 'Article'; bib = [ ... 
'author = {Nandini, S. and Sarma, S. S. S. and Ramirez-Garcia, P.}, ' ... 
'year = {2005}, ' ...
'title = {Length-weight relationships of three Cladoceran species from a tropical reservoir in {M}exico}, ' ...
'journal = {J. Freshwater Ecol.}, ' ...
'volume = {20}, ' ...
'pages = {405--406}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
