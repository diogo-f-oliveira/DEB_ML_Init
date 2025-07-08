function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_brevirostrum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_brevirostrum'; 
metaData.species_en = 'Shortnose sturgeon'; 

metaData.ecoCode.climate = {'MB','MC','Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - this is not sure as the species  migrates from sea to fresh water
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww','T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 13];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 13]; 

%% set data
% zero-variate data;
data.am = 67*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wood2005';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 50;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 143;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wood2005';

data.Wwb = 2.24e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'HardLitv2004';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwi = 23.6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wood2005';
 
data.Ri  = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth, (yr), total length (cm)
4.86	58.99
6.03	63.93
7.11	62.82
7.98	67.75
8.99	73.35
10.01	78.06
11.17	76.73
12.11	78.52
13.12	79.88
13.98	80.55
14.83	80.78
15.92	83.48
16.93	81.25
17.72	86.40
18.81	87.75
20.04	83.96
20.84	102.10
21.83	81.95
22.85	92.71
24.87	88.02
25.89	100.12
28.67	84.47
29.93	99.70];
data.tL(:,1) = 365 * (0.75 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wood2005';
comment.tL = 'Data from Hudson River';

% time-weight
data.tWw = [ ... % time since birth, (yr), wet weight (g)
4.98	1046.46
5.86	1284.74
6.74	1371.39
8.03	1631.34
8.83	2151.23
9.87	2606.13
10.83	2497.82
11.72	2649.46
12.92	2844.41
14.05	2952.73
14.69	3104.36
15.89	3212.67
16.86	3169.35
17.74	3710.90
18.78	3862.53
20.78	5292.23
21.93	3191.01
24.73	4079.16
25.85	4707.36
28.85	2562.81
29.78	5400.55];
data.tWw(:,1) = 365 * (0.75 + data.tWw(:,1)); % convert yr to d
units.tWw = {'d', 'g'};     label.tWw = {'time since birth', 'wet weight'};  
  temp.tWw = C2K(13);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Wood2005';
comment.tWw = 'Data from Hudson River';

data.Tab = [ ... % temperature (C), age at yolk sac resoption (d)
13	34.11
15	25.68
18	20.66
21	12.69];
units.Tab = {'C', 'd'};     label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'HardLitv2004';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Tab = 5 * weights.Tab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
 
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed to differ from females by E_Hp only; they are somewhat smaller than females, but data is lacking';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '9C52'; % Cat of Life
metaData.links.id_ITIS = '161069'; % ITIS
metaData.links.id_EoL = '47229407'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_brevirostrum'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_brevirostrum'; % ADW
metaData.links.id_Taxo = '107315'; % Taxonomicon
metaData.links.id_WoRMS = '157869'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-brevirostrum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_brevirostrum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wood2005'; type = 'phdthesis'; bib = [ ...  
'author = {Ryan J. Woodland}, ' ...
'year = {2005}, ' ...
'title = {Age, growth and recruitment of {H}udson {R}iver shortnose sturgeon (\emph{Acipenser brevirostrum})}, ' ... 
'school = {University of Maryland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HardLitv2004'; type = 'Article'; bib = [ ...  
'author = {Ryan S. Hardy and Matthew K. Litvak}, ' ...
'year = {2004}, ' ...
'title = {Effects of temperature on the early development, growth, and survival of shortnose sturgeon, \emph{Acipenser brevirostrum}, and {A}tlantic sturgeon, \emph{Acipenser oxyrhynchus}, yolk-sac larvae}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {70}, ' ...
'pages = {145-154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-brevirostrum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

