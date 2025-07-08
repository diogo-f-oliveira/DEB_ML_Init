  function [data, auxData, metaData, txtData, weights] = mydata_Hemiaspis_damelii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Hemiaspis_damelii'; 
metaData.species_en = 'Gray snake'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data
data.am = 10*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 14.7;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1978';
data.Lp = 30;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Shin1978'; 
data.Li = 58;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 63;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 2.9;   units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on size-corrected value for Notechis_scutatus: 4.5*(14.7/17)^3';
data.Wwi = 273;     units.Wwi = 'g';     label.Wwi = 'ultimate weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Notechis_scutatus: 1400*(58/100)^3';

data.Ri = 12/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-16 young per clutch, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL_f = [ ... % time since birth (d), snout-vent length (cm)
175.428	14.776
213.887	15.287
217.575	19.281
365-1.617	26.481
365+6.488	25.516
365+19.798	23.780
365+25.242	27.962
365+26.943	27.007
365+27.950	23.768
365+72.010	31.699
365+77.186	30.358
365+177.554	34.582
730+22.691	47.395
730+25.325	53.677
730+26.074	57.104
730+29.669	47.194
730+74.811	53.409
730+131.515	57.892
730+177.646	48.486
730+181.611	58.194
];
data.tL_f(:,1) = data.tL_f(:,1) - 175; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), snout-vent length (cm)
365+19.853	36.923
365+20.667	29.684
365+25.501	33.295
365+27.756	43.768
365+28.015	37.101
365+28.107	39.006
365+30.557	29.478
365+72.205	35.699
365+127.560	36.374
365+132.116	34.272
365+135.259	39.029
365+135.758	37.314
365+135.924	40.742
365+136.007	42.456
365+136.118	44.742
365+138.041	36.358
365+173.866	42.588
365+177.082	36.868
730+26.841	48.912
730+26.906	50.246
730+27.257	57.483
730+27.359	59.578
730+27.571	51.959
730+218.111	54.328
730+219.692	62.897];
data.tL_m(:,1) = data.tL_m(:,1) - 175; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'snout-vent length', 'male'};  
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shin1978';
comment.tL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KLH2'; % Cat of Life
metaData.links.id_ITIS = '700514'; % ITIS
metaData.links.id_EoL = '456559'; % Ency of Life
metaData.links.id_Wiki = 'Hemiaspis_damelii'; % Wikipedia
metaData.links.id_ADW = 'Hemiaspis_damelii'; % ADW
metaData.links.id_Taxo = '90755'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hemiaspis&species=damelii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiaspis_damelii}}';
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
bibkey = 'Shin1978'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1978}, ' ...
'title = {Growth Rates and Sexual Maturation in Six Species of {A}ustralian {E}lapid Snakes}, ' ... 
'journal = {Herpetologica}, ' ...
'volume = {34(1)}, '...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


