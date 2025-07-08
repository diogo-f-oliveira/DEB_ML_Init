function [data, auxData, metaData, txtData, weights] = mydata_Tylos_capensis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Tylidae';
metaData.species    = 'Tylos_capensis'; 
metaData.species_en = 'Isopod'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 04]; 

%% set data
% zero-variate data

data.am = 5*365;    units.am = 'd';     label.am = 'life span';                         bibkey.am  = 'McLaSieb1991';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.15;   units.Lb  = 'cm';  label.Lb  = 'total length at birth for female';    bibkey.Lb  = 'McLaSieb1991';
data.Lp  = 0.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'McLaSieb1991';
data.Li  = 1.26;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'McLaSieb1991';
data.Lim  = 1.43;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';   bibkey.Lim  = 'McLaSieb1991';

data.Wdi = 0.227;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight for female';   bibkey.Wdi = 'McLaSieb1991';
  comment.Wdi = 'based on 10^(2.55 * log10(10*Li) - 3.45), see F2';

data.Ri  = 2*11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'McLaSieb1991';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11 embryos per brood at TL 0.89 cm: 2 broods per yr';
  
% uni-variate data
% t-L data
data.tL = [ ... % time at stage change (d), length (cm)
90.486	0.292
160.189	0.288
183.322	0.332
274.336	0.387
293.833	0.460
331.262	0.503
356.173	0.551
379.289	0.603
384.793	0.539
443.551	0.635
506.052	0.655
627.527	0.674
650.508	0.786
678.814	0.915
710.963	0.922
735.883	0.966
771.722	0.922
798.483	0.942
860.958	0.974
886.228	0.861
980.538	1.041
1005.870	0.901
1068.301	0.953
1124.976	1.181
1150.093	1.137
1239.490	1.116
1253.634	1.184
1353.521	1.268
1376.851	1.223
1416.112	1.247];
data.tL(:,1) = data.tL(:,1) - 0;
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McLaSieb1991';
comment.tL = 'Temperature is assumed to oscillate between 5 and 35 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 8 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature in C for tL data varies with time in d as T(t)=20+15*sin(2*pi*(t+10)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'width-length: length in mm = 2.33 * (width in mm) - 0.44';
metaData.bibkey.F1 = 'McLaSieb1991'; 
F2 = 'width-weight: log10(ash-free dry weight in g) = 2.55 * log10(width in mm) - 3.45';
metaData.bibkey.F2 = 'McLaSieb1991'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7CZQF'; % Cat of Life
metaData.links.id_ITIS = '597550'; % ITIS
metaData.links.id_EoL = '318885'; % Ency of Life
metaData.links.id_Wiki = 'Tylos_(genus)'; % Wikipedia
metaData.links.id_ADW = 'Tylos_capensis'; % ADW
metaData.links.id_Taxo = '624935'; % Taxonomicon
metaData.links.id_WoRMS = '257591'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tylos}}';
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
bibkey = 'McLaSieb1991'; type = 'Article'; bib = [ ... 
'author = {Anton McLachlan and Paul R. Sieben}, ' ... 
'year = {1991}, ' ...
'title = {Growth and Production of \emph{Tylos capensis} {K}rauss, 1843 ({I}sopoda)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {61(1)}, ' ...
'pages = {43-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

