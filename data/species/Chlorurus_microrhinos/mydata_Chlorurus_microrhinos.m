function [data, auxData, metaData, txtData, weights] = mydata_Chlorurus_microrhinos
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Chlorurus_microrhinos'; 
metaData.species_en = 'Steephead parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TaylChoat2014';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Lim  = 70;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 1e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01445*Lp^3.03, see F1';
data.Wwi = 5.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.03, see F1; max published weight 5.4 kg';

data.GSI = 3*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps, assumed: 3 spawnings per year';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.917	21.125
1.159	14.946
1.890	27.498
1.947	19.530
1.980	30.320
1.991	22.097
2.028	29.033
2.033	25.435
2.034	24.921
2.036	22.866
2.090	17.981
2.910	33.612
2.966	26.929
2.967	25.901
3.010	28.982
3.936	35.101
3.980	37.154
3.987	32.015
3.989	30.730
3.990	29.703
4.039	27.901
4.918	34.794
4.921	32.738
4.970	30.680
5.942	37.824
6.038	36.278
10.981	43.732];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylChoat2014'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.894	24.928
1.989	23.382
2.960	31.297
3.834	41.530
3.892	33.305
4.958	40.187
4.998	45.067
4.999	44.296
5.001	43.011
5.006	39.157
5.007	37.872
6.031	41.160
6.955	49.591
6.964	42.140
8.039	42.598];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylChoat2014'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01445*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XYWM'; % Cat of Life
metaData.links.id_ITIS = '614614'; % ITIS
metaData.links.id_EoL = '46572690'; % Ency of Life
metaData.links.id_Wiki = 'Chlorurus_microrhinos'; % Wikipedia
metaData.links.id_ADW = 'Chlorurus_microrhinos'; % ADW
metaData.links.id_Taxo = '316216'; % Taxonomicon
metaData.links.id_WoRMS = '277507'; % WoRMS
metaData.links.id_fishbase = 'Chlorurus-microrhinos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlorurus_microrhinos}}';
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
bibkey = 'TaylChoat2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12294}, ' ...
'author = {B. M. Taylor and J. H. Choat}, ' ... 
'year = {2014}, ' ...
'title = {Comparative demography of commercially important parrotfish species from {M}icronesia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {84}, ' ...
'pages = {283-546}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chlorurus-microrhinos.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

