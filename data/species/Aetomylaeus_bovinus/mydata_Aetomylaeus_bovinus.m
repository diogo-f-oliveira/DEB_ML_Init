function [data, auxData, metaData, txtData, weights] = mydata_Aetomylaeus_bovinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Aetomylaeus_bovinus'; 
metaData.species_en = 'Bull ray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 10];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 11*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Wiki';    
  temp.ab = C2K(17.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6-12 mnth';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BasuAsla2018';   
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 45; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';
data.Lp  = 95; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'BasuAsla2018';
  comment.Lp = '50-56 cm';
data.Lpm  = 80; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'BasuAsla2018';
  comment.Lpm = '41-46 cm';
data.Li  = 222;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase';

data.Wwi = 116e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 pups per litter, assumed 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.972	40.507
0.973	38.051
1.978	42.944
4.041	71.150
5.993	105.806
6.917	110.393
6.972	108.243
8.032	116.205
8.984	118.029
10.017	122.614
12.901	124.708
13.989	128.678];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
  temp.tL_f = C2K(17.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BasuAsla2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.973	35.595
2.004	47.242
2.005	45.707
2.006	43.865
2.031	49.697
2.956	53.364
2.957	51.829
2.982	55.819
3.036	60.731
3.037	57.353
3.906	63.477
3.961	60.406
3.986	72.379
3.987	65.011
4.014	69.001
4.015	66.545
4.964	78.808
4.965	77.273
4.966	75.431
4.967	72.360
4.990	85.562
4.991	82.184
4.992	79.728
6.052	80.629];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
  temp.tL_m = C2K(17.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BasuAsla2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65DPB'; % Cat of Life
metaData.links.id_ITIS = '160989'; % ITIS
metaData.links.id_EoL = '46561032'; % Ency of Life
metaData.links.id_Wiki = 'Aetomylaeus_bovinus'; % Wikipedia
metaData.links.id_ADW = 'Myliobates_episcopus'; % ADW
metaData.links.id_Taxo = '5229818'; % Taxonomicon
metaData.links.id_WoRMS = '871951'; % WoRMS
metaData.links.id_fishbase = 'Aetomylaeus-bovinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Aetomylaeus_bovinus}}'; 
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
bibkey = 'BasuAsla2018'; type = 'Article'; bib = [ ... 
'doi = {10.21411/CBM.A.5F77152E}, ' ...
'author = {Nuri Ba\c{s}usta and Erg\"{u}n Aslan}, ' ...
'year = {2018}, ' ...
'title = {Age and growth of bull ray \emph{Aetomylaeus bovinus} ({C}hondrichthyes: {M}yliobatidae) from the northeastern {M}editerranean coast of {T}urkey}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {59}, ' ...
'pages = {107-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Aetomylaeus-bovinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  