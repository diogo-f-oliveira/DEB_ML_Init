function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_mento

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_mento'; 
metaData.species_en = 'Iridescent toothcarp'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 8 * 365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'GuclKucu2008';   
  temp.am = C2K(17.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.45;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'GuclKucu2011'; 
data.Li  = 5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.0e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';   bibkey.Wwb = 'GuclKucu2011';
  comment.Wwb = 'based on egg diameter of 1.24 mm: pi/6*0.124^3';
data.Wwi = 1.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi=  'based on 0.00977*Li^3.26, see F1';
  
data.Ri  = 228/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'GuclKucu2011';   
temp.Ri = C2K(17.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... %  year class (yr), total length (cm)
    0 2.46
    1 3.36
    2 4.20
    3 4.77
    4 5.69
    5 6.09
    6 6.60
    7 7.80];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % covert mnth to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(17.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GuclKucu2008';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... %  year class (yr), total length (cm)
    0 2.51
    1 3.47
    2 4.61
    3 4.84
    4 5.56
    5 6.29
    6 7.06
    7 7.30];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % covert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(17.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GuclKucu2008';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
1.413	0.059
1.490	0.085
1.531	0.093
1.549	0.090
1.590	0.098
1.640	0.098
1.667	0.098
1.704	0.098
1.772	0.103
1.790	0.119
1.863	0.129
1.881	0.111
1.904	0.139
1.913	0.124
1.940	0.124
1.954	0.145
1.976	0.124
2.004	0.139
2.045	0.129
2.045	0.152
2.081	0.168
2.108	0.152
2.127	0.176
2.154	0.158
2.168	0.181
2.172	0.168
2.231	0.189
2.236	0.152
2.281	0.184
2.291	0.228
2.299	0.197
2.336	0.223
2.363	0.225
2.381	0.199
2.395	0.249
2.445	0.236
2.449	0.212
2.495	0.220
2.495	0.272
2.522	0.254
2.554	0.283
2.573	0.278
2.586	0.293
2.668	0.293
2.695	0.298
2.741	0.312
2.755	0.332
2.777	0.322
2.809	0.332
2.850	0.340
2.873	0.330
2.909	0.343
2.909	0.364
2.941	0.353
2.973	0.374
2.996	0.372
3.018	0.372
3.032	0.392
3.055	0.377
3.068	0.392
3.109	0.392
3.137	0.408
3.200	0.421
3.214	0.437
3.237	0.450
3.255	0.466
3.305	0.479
3.328	0.479
3.374	0.507
3.410	0.531
3.410	0.555
3.483	0.557
3.515	0.623
3.565	0.594
3.638	0.651
3.752	0.659
3.783	0.672
3.816	0.724
3.884	0.756
3.952	0.766
3.971	0.803
4.012	0.821
4.084	0.800
4.084	0.837
4.162	0.873
4.321	0.944
4.322	0.970
4.413	1.007];
units.LWw = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Ergu2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males as supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977 * (TL in cm)^3.26';
metaData.bibkey.F1 = 'fishbase';
F2 = 'a short-lived species';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'FB63'; % Cat of Life
metaData.links.id_ITIS = '647066'; % ITIS
metaData.links.id_EoL = '574262'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_mento'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_mento'; % ADW
metaData.links.id_Taxo = '44469'; % Taxonomicon
metaData.links.id_WoRMS = '1022156'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-mento'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_mento}}';
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
bibkey = 'GuclKucu2008'; type = 'Article'; bib = [ ... 
'author = {Salim Serkan G\"{u}\c{c}l\"{u} and Fadrettin K\"{u}\c{c}\"{u}k}, ' ... 
'year = {2008}, ' ...
'title = {Population Age, Sex Structure, Growth and Diet of \emph{Aphanius mento} {H}eckel in: {R}ussegger, 1843 ({C}yprinodontidae: {T}eleostei), at {K}{\i}rkg\"{o}z {S}pring, {A}ntalya-{T}\"{u}rkiye}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {8}, ' ...
'pages = {269-274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuclKucu2011'; type = 'Article'; bib = [ ... 
'doi = {10.4194/trjfas.2011.0217}, '...
'author = {Salim Serkan G\"{u}\c{c}l\"{u} and Fadrettin K\"{u}\c{c}\"{u}k}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive Biology of \emph{Aphanius mento} ({H}eckel in: {R}ussegger, 1843) ({O}steichthyes: {C}yprinodontidae) in {K}{\i}rkg\"{o}z {S}pring ({A}ntalya-{T}urkey)}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {11}, ' ...
'pages = {323-327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ergu2020'; type = 'Article'; bib = [ ... 
'doi = {10.22092/ijfs.2019.118929}, ' ...
'author = {Erguden S.A.}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth of iridescent toothcarp \emph{Aphanius mento} ({H}eckel, 1843) ({C}yprinodontidae) in {S}eyhan {R}eservoir ({S}outheastern {M}editerranean, {T}urkey)}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {19(5)}, ' ...
'pages = {2340-2353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphanius-mento.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

