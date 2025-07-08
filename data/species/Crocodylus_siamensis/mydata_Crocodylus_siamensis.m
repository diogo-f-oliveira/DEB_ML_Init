function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_siamensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Crocodylus_siamensis'; 
metaData.species_en = 'Siamese crocodile'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 19];


%% set data
% zero-variate data

data.ab = 74;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'PlatNomy2012';   
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '68-80 d';
data.tp = 6*365;      units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PlatNomy2012';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '8-10 yr';
data.tpm = 6*365;      units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'PlatNomy2012';   
  temp.tpm = C2K(23); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '12-15 yr';
data.am = 49*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 28.5;    units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on C. palustris';
data.Lp  = 200;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on C. palustris';
data.Lpm  = 260;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'guess'; 
  comment.Lpm = 'based on C. palustris';
data.Li  = 320;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 400;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 90.8;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'PlatNomy2012';
  comment.Wwb = 'PlatNomy2012 give 121.6 g';
data.Wwi = 150e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
data.Wwim = 350e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 40/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15-50 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% length-weight
WL_f = [ ... % wet weight (g), total length (cm)
144.962	     31.979
3425.372	102.348
6063.843	118.796
11151.825	146.306
12681.813	145.079
13482.956	151.593
13483.546	156.603
14331.044	156.949
14683.969	155.391
14966.815	158.461
15014.304	161.927
15226.667	166.156
15837.628	156.880
16027.356	168.817
16050.398	164.577
16802.783	156.835
16992.466	168.387
18122.313	167.564
19511.557	170.582
20429.675	170.925
20946.610	162.809
21983.793	174.707];
data.LW_f = WL_f(:,[2 1]);
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'female'};  
bibkey.LW_f = 'ChenHugg1983';
comment.LW_f = 'Data for females';
%
WL_m = [ ... % wet weight (g), total length (cm)
7430.726	131.835
10515.737	142.097
11079.254	129.739
12869.501	139.676
14024.838	155.422
14189.077	150.790
15484.704	158.437
15579.274	161.901
16450.720	165.714
16473.082	155.694
17556.981	164.507
18451.379	163.310
18945.634	162.516
18945.952	165.214
18946.450	169.452
19465.064	175.594
19511.421	169.426
20030.352	178.266
21489.444	174.730
22360.483	175.075
22949.084	175.818];
data.LW_m = WL_m(:,[2 1]);
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'male'};  
bibkey.LW_m = 'ChenHugg1983';
comment.LW_m = 'Data for males';
 
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

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNS'; % Cat of Life
metaData.links.id_ITIS = '202202'; % ITIS
metaData.links.id_EoL = '795275'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_siamensis'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_siamensis'; % ADW
metaData.links.id_Taxo = '50638'; % Taxonomicon
metaData.links.id_WoRMS = '1478596'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=siamensis'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_siamensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_siamensis}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_siamensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Crocodylus_siamensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChenHugg1983'; type = 'article'; bib = [ ...  
'author = {Thyon Chentanez and Sara E. Huggins and Vilai Chentanez}, ' ...
'year = {1983}, ' ...
'title  = {Allometric relationships of th {S}iamese crocodile, \emph{Crocodylus siamensis}}, ' ...
'journal = {J. Sci. Soc. Thailand}, ' ...
'volume = {9}, ' ...
'pages = {5-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PlatNomy2012'; type = 'article'; bib = [ ...  
'doi = {10.1002/zoo.20418}, ' ...
'author = {Platt, S. G. and Monyrath, V. and Sovannara, H. and Kheng, L.  and Rainwater, T. R. }, ' ...
'year = {2012}, ' ...
'title  = {Nesting phenology and clutch characteristics of captive Siamese crocodiles (\emph{Crocodylus siamensis}) in {C}ambodia}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {30}, ' ...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PlatNomy2012'; type = 'article'; bib = [ ...  
'author = {Pchution Kanwatakid-Savini and Manoon Pliosungnoen and Anak Pattanavibool and John B. Thorbjarnarson and Cchaiwat Limlikhitaksorn and Steven G. Platt}, ' ...
'year = {2012}, ' ...
'title  = {A SURVEY TO DETERMINE THE CONSERVATION STATUS OF {S}IAMESE CROCODILES IN {K}AENG {K}RACHAN {N}ATIONAL {P}ARK, {T}HAILAND}, ' ...
'journal = {Herpetological Conservation and Biology}, ' ...
'volume = {7(2)}, ' ...
'pages = {157–168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];




