function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_radiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_radiatus'; 
metaData.species_en = 'Oblique-banded grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data

data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MaheRabh2016';   
  temp.am = C2K(23.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 21;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
comment.Lp = 'based on Epinephelus_marginatus: 45*70/150';
data.Li  = 70;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 230;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^3.11, see F1';
data.Wwi = 9.7e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^3.11, see F1';

data.Ri  = 293382/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.011	12.045
2.038	25.060
2.965	25.345
2.966	27.420
2.967	28.666
2.984	34.476
2.999	32.401
3.015	27.283
3.031	29.496
3.032	30.741
3.958	30.197
3.960	37.252
3.990	30.197
3.991	30.889
3.993	40.020
4.006	33.518
4.007	34.486
4.008	36.008
4.009	36.700
4.010	38.083
4.023	31.996
4.024	34.210
4.025	35.316
5.001	40.721
5.034	40.306
5.035	41.137
5.036	41.690
5.037	42.382
5.038	43.627
5.051	44.457
5.978	44.881
7.018	47.105
7.019	48.488
8.013	54.308
8.027	46.008
8.028	48.360
8.029	55.969
8.045	52.372
9.021	56.255
10.013	56.680
12.973	60.583
13.006	62.105
13.040	65.010];
data.tL(:,1) = (0.25 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'female'};  
temp.tL    = C2K(23.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaheRabh2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Hermaphroditic, so kap_R is reduced ba a factor 2';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.01778*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G63K'; % Cat of Life
metaData.links.id_ITIS = '551090'; % ITIS
metaData.links.id_EoL = '46579638'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_radiatus'; % ADW
metaData.links.id_Taxo = '173925'; % Taxonomicon
metaData.links.id_WoRMS = '218222'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-radiatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus}}';
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
bibkey = 'MaheRabh2016'; type = 'Article'; bib = [ ... 
'author = {K\''{e}lig Mah\''{e} and Khalef Rabhi and Elise Bellamy and Romain Elleboode and Yoann Aumond and J\''{e}r\^{o}me Huet and Pierre Cresson and David Roos}, ' ... 
'year = {2016}, ' ...
'title = {Growth of the oblique-banded grouper (\emph{Epinephelus radiatus}) on the coasts of {R}eunion {I}sland ({S}{W} {I}ndian {O}cean)}, ' ...
'journal = {Cybium}, ' ...
'volume = {40(1)}, ' ...
'pages = {61-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-radiatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

