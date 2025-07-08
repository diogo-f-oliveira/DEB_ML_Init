  function [data, auxData, metaData, txtData, weights] = mydata_Hemiaspis_signata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Hemiaspis_signata'; 
metaData.species_en = 'Black-bellied swamp snake'; 

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

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

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
  
data.Lb = 10;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1978';
data.Lp = 35;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Shin1978'; 
data.Li = 50;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 55;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 0.9;   units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on size-corrected value for Notechis_scutatus: 4.5*(10/17)^3';
data.Wwi = 175;     units.Wwi = 'g';     label.Wwi = 'ultimate weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Notechis_scutatus: 1400*(50/100)^3';

data.Ri = 12/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-16 young per clutch for Hemiaspis damelii, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL_f = [ ... % time since birth (d), snout-vent length (cm)
167.927	10.820
177.270	12.143
196.535	14.597
232.072	15.305
234.408	15.684
240.840	17.011
258.365	19.850
258.384	20.806
365+45.855	22.094
365+84.974	27.383
365+140.977	32.454
365+193.987	33.327
365+200.864	27.583
365+221.850	28.697
365+261.455	29.017
730+24.843	49.643
730+27.210	51.550
730+32.833	41.222
730+53.681	35.266
730+72.560	47.848
730+105.760	48.178
730+140.154	50.035
730+141.790	44.300
730+143.466	40.667
730+170.791	38.331
730+180.212	43.667
730+227.350	42.064
730+227.836	37.095
730+234.868	39.377
730+236.593	38.228
730+259.311	38.575];
data.tL_f(:,1) =  data.tL_f(:,1) - 167; % set origin to birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), snout-vent length (cm)
730+25.503	53.654
730+48.155	50.562
730+71.748	36.002
730+80.364	29.874
730+171.481	43.872
730+172.200	50.940
730+186.543	39.835
730+198.802	41.345
730+209.298	42.093
730+211.019	40.752
730+219.476	56.408
730+227.877	39.197
730+227.966	43.783
730+231.226	31.740
730+236.886	53.323
730+261.670	40.100];
data.tL_m(:,1) =  data.tL_m(:,1) - 167; % set origin to birth
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
F2 = 'May be partly marine';
metaData.bibkey.F2 = 'ReptileDB'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KLH5'; % Cat of Life
metaData.links.id_ITIS = '700515'; % ITIS
metaData.links.id_EoL = '46559626'; % Ency of Life
metaData.links.id_Wiki = 'Hemiaspis_signata'; % Wikipedia
metaData.links.id_ADW = 'Hemiaspis_signata'; % ADW
metaData.links.id_Taxo = '90756'; % Taxonomicon
metaData.links.id_WoRMS = '407696'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hemiaspis&species=signata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiaspis_signata}}';
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
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Hemiaspis&species=signata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


