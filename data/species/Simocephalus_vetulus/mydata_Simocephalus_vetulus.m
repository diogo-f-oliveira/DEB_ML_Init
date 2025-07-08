function [data, auxData, metaData, txtData, weights] = mydata_Simocephalus_vetulus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Simocephalus_vetulus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'Wdi'}; 
metaData.data_1     = {'t-L_T'; 't-N_T'; 't-S_T'; 'T-ap'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 02]; 

%% set data
% zero-variate data

data.ab = 1.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 

data.Lb  = 0.056; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'LeeBan1999';
data.Lp  = 0.26; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'LeeBan1999','Bott1975'};
  comment.Lp = 'based on Ttp and tL data';
data.Li  = 0.38;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';
data.Lim  = 0.13;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'nina';

data.Wdi = 47.3;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'LemkBenk2003';
  comment.Wdi = 'based F1 for L = 3.8 mm, see facts';

data.Ri = 15/3.8;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Bott1975';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 15 egg per brood, 3.8 d per moult 11.75 d at 20 C)';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
 1	0.561 0.557
 2	0.560 0.585
 3	0.761 0.714
 4	0.920 0.842
 5	0.989 0.907
 6	1.311 1.045
 7	1.308 1.129
 8	1.517 1.207
 9	1.530 1.314
10	1.529 1.345
11	1.689 1.357
12	1.689 1.372
13	1.692 1.385
14	1.801 1.519
15	1.807 1.522
16	1.810 1.525
17	1.916 1.568
18	1.916 1.574
19	1.919 1.577
20	1.915 1.596
21	1.993 1.599
22	2.003 1.627];
data.tL(:,2:3) = data.tL(:,2:3)/ 10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeeBan1999'; treat.tL = {1 {'1 ind/vial','80 ind/vial'}};

% T-tp data
data.Ttp = [ ... temperature (C), time since birth at puberty (d)
    10 0.48*76
    15 0.39*57
    20 0.38*38];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'Bott1975';

% temperature-time since birth at puberty
data.Tam = [ ... % temperature (C), life span (d)
   10 76
   15 57
   20 38];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'mean life span'};  
bibkey.Tam = 'Bott1975';  


%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3*weights.Li;

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
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'dry weight: ln (W in mug) = 2.568 + 2.192 * ln (L in mm)';
metaData.bibkey.F1 = 'LemkBenk2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XFK9'; % Cat of Life
metaData.links.id_ITIS = '83901'; % ITIS
metaData.links.id_EoL = '83902'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Simocephalus_vetulus'; % ADW
metaData.links.id_Taxo = '33112'; % Taxonomicon
metaData.links.id_WoRMS = '148404'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Simocephalus%%20vetula.pdf}}';
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
bibkey = 'LeeBan1999'; type = 'Article'; bib = [ ... 
'author = {Hong-wu Lee and Syuhei Ban}, ' ... 
'year = {1999}, ' ...
'title = {Effect of crowding on growth and reproduction of \emph{Simocephalus vetulus} {O}.{F}. {M}\"{u}ller}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {391}, ' ...
'pages = {135–145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bott1975'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00369097}, ' ...
'author = {Howard H. Bottrell}, ' ... 
'year = {1975}, ' ...
'title = {Generation time, length of life, instar duration and frequency of moulting, and their relationship to temperature in eight species of cladocera from the {R}iver {T}hames, {R}eading}, ' ...
'journal = {Oecologia (Berl.)}, ' ...
'volume = {19(2)}, ' ...
'pages = {129–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LemkBenk2003'; type = 'Article'; bib = [ ... 
'author = {Lemke, A. M. and Benke, A. C.}, ' ... 
'year = {2003}, ' ...
'title = {Growth and reproduction of three cladoceran species from a small wetland in the {S}outh-{E}astern {U}.{S}.{A}.}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {48}, ' ...
'pages = {589--603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
