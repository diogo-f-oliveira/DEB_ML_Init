function [data, auxData, metaData, txtData, weights] = mydata_Octopus_bimaculoides

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_bimaculoides'; 
metaData.species_en = 'California two-spot octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi';  'Ni'}; 
metaData.data_1     = {'t-L_T', 'L-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 14 ]; 

%% set data
% zero-variate data

data.ab = 46;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ForsHanl1988';   
  temp.ab = C2K(23);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 404;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ForsHanl1988';   
  temp.am = C2K(18);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 10;    units.Lp = 'cm';   label.Lp = 'dorsal mantle length at puberty';   bibkey.Lp = 'ForsHanl1988';
  comment.Lp = 'based on maturing in the second year, combined with tL data';
data.Li = 12;    units.Li = 'cm';   label.Li = 'ultimate dorsal mantle length';   bibkey.Li = 'ForsHanl1988';

data.Wwb = 0.07; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ForsHanl1988';
data.Wwi = 619; units.Wwi = 'g';   label.Wwi = 'wet weight at death';     bibkey.Wwi = 'ForsHanl1988';

data.Ni  = 2e3; units.Ni  = '#';   label.Ni  = 'cum reprod at 404 d';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(18);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Octopus joubini';
 
% uni-variate data
% time-length 
data.tL_18 = [ ... % time since birth (d), dorsal mantle length (cm)
    14  0.776
    29  0.879
    36  0.981
    43  1.040
    57  1.101
    85  1.573
    99  1.881
   114  2.145
   128  2.145
   142  3.485
   156  3.864
   170  4.350
   183  4.566
   198  5.133
   212  5.294
   218  5.437
   240  6.374
   268  7.504
   289  7.500
   324  9.744
   370 10.840];
units.tL_18   = {'d', 'cm'};  label.tL_18 = {'time', 'dorsal mantle length', '18 C'};  
temp.tL_18    = C2K(18);  units.temp.tL_18 = 'K'; label.temp.tL_18 = 'temperature';
bibkey.tL_18 = 'ForsHanl1988';
comment.tL_18 = 'Data at 18 C';
%
data.tL_23 = [ ... % time since birth (d), dorsal mantle length (cm)
    14  0.716
    29  0.884
    36  1.033
    43  1.142
    57  1.353
   128  4.077
   142  5.183
   156  5.906
   170  6.794
   183  6.923
   198  7.809
   212  7.992
   218  7.831
   240  9.100
   268 10.187
   289 10.375
   324 11.629
   370 13.238];
units.tL_23   = {'d', 'cm'};  label.tL_23 = {'time', 'dorsal mantle length', '23 C'};  
temp.tL_23    = C2K(23);  units.temp.tL_23 = 'K'; label.temp.tL_23 = 'temperature';
bibkey.tL_23 = 'ForsHanl1988';
comment.tL_23 = 'Data at 23 C';

% time-weight 
data.tWw_18 = [ ... % time since birth (d), wet weight (d)
    14   0.14
    29   0.25
    36   0.33
    43   0.39
    57   0.63
    85   1.65
    99   2.55
   114   3.63
   128  10.28
   142  15.23
   156  21.18
   170  31.73
   183  39.66
   198  55.48
   212  66.23
   218  61.82
   240 103.94
   268 174.23
   289 201.89
   324 350.28
   370 505.17
   404 618.89];
units.tWw_18   = {'d', 'g'};  label.tWw_18 = {'time', 'wet weight', '18 C'};  
temp.tWw_18    = C2K(18);  units.temp.tWw_18 = 'K'; label.temp.tWw_18 = 'temperature';
bibkey.tWw_18 = 'ForsHanl1988';
comment.tWw_18 = 'Data at 18 C';
%
data.tWw_23 = [ ... % time since birth (d), wet weight (d)
    14   0.15
    29   0.28
    36   0.39
    43   0.53
    57   1.08
   128  25.63
   142  49.70
   156  67.01
   170 103.21
   183 130.21
   198 174.86
   212 196.39
   218 175.68
   240 268.39
   268 371.77
   289 383.24
   324 517.53
   370 597.53
   404 584.56];
units.tWw_23   = {'d', 'g'};  label.tWw_23 = {'time', 'wet weight', '23 C'};  
temp.tWw_23    = C2K(23);  units.temp.tWw_23 = 'K'; label.temp.tWw_23 = 'temperature';
bibkey.tWw_23 = 'ForsHanl1988';
comment.tWw_23 = 'Data at 23 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_18 = 5 * weights.tWw_18;
weights.tWw_23 = 5 * weights.tWw_23;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_23','tL_18'}; subtitle1 = {'Data for 23, 18 C'};
set2 = {'tWw_23','tWw_18'}; subtitle2 = {'Data for 23, 18 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '48KK8'; % Cat of Life
metaData.links.id_ITIS = '82618'; % ITIS
metaData.links.id_EoL = '492290'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_bimaculoides'; % Wikipedia
metaData.links.id_ADW = 'Octopus_bimaculoides'; % ADW
metaData.links.id_Taxo = '158207'; % Taxonomicon
metaData.links.id_WoRMS = '341952'; % WoRMS
metaData.links.id_molluscabase = '341952'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_bimaculoides}}';
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
bibkey = 'ForsHanl1988'; type = 'Article'; bib = [ ... 
'author = {J. W. Forsythe and R.T. Hanlon}, ' ... 
'year = {1988}, ' ...
'title = {Effect of temperature on laboratory growth, reproduction and life span of \emph{Octopus bimaculoides}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {98}, ' ...
'pages = {369-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Octopus-bimaculoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

