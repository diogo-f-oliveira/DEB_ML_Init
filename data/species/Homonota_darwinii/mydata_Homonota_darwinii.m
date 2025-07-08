function [data, auxData, metaData, txtData, weights] = mydata_Homonota_darwinii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phyllodactylidae';
metaData.species    = 'Homonota_darwinii'; 
metaData.species_en = 'Darwin''s marked gecko'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTs'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 07 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 11];

%% set data
% zero-variate data

data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KubiPian2012';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KubiPian2012';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.7;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'KubiPian2012';  
data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'KubiPian2012';  
data.Li  = 4.8;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'KubiPian2012';  
data.Lim  = 4.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'KubiPian2012';  

data.Wwi = 2.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Heteronotia_binoei: (4.8/5)^3*3.1';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'KubiPian2012';   
  temp.Ri = C2K(16);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 young per clutch, 1 clutch each 1 or 2 yr';

% univariate data
% time -  length data
data.tL = [ ... % age (yr),  SVL (cm)
0.980	2.250
0.980	2.340
1.001	1.755
1.001	2.030
1.002	2.058
1.003	2.512
2.016	3.187
2.016	3.249
2.026	2.836
2.028	3.510
2.972	3.517
2.973	3.758
2.973	3.848
2.973	3.875
2.984	3.614
3.005	3.324
3.005	3.380
3.007	4.040
3.973	3.648
3.983	3.517
3.987	4.818
3.987	4.915
3.996	3.896
3.996	3.965
4.008	4.226
4.008	4.295
4.008	4.474
4.017	3.462
4.028	3.744
4.975	4.633
4.986	4.522
4.987	4.694
4.987	4.750
4.997	4.247
4.997	4.433
4.998	4.805
4.998	4.853
4.999	5.238
5.007	4.137
5.008	4.213
5.008	4.288
5.008	4.330
5.008	4.350
5.010	4.997
5.017	3.779
5.018	3.834
5.018	4.040
5.987	4.977
5.997	4.550
5.998	4.619
6.008	4.275
6.009	4.688
6.018	4.054
6.019	4.323
6.019	4.467
6.964	4.612
6.964	4.701
6.974	4.206
6.997	4.419
6.998	4.798
7.009	4.880
7.987	4.991
8.009	4.653
9.009	4.839
9.031	4.674];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KubiPian2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6MD2G'; % Cat of Life
metaData.links.id_ITIS = '818756'; % ITIS
metaData.links.id_EoL = '793262'; % Ency of Life
metaData.links.id_Wiki = 'Homonota_darwinii'; % Wikipedia
metaData.links.id_ADW = 'Homonota_darwinii'; % ADW
metaData.links.id_Taxo = '4683719'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Homonota&species=darwinii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Homonota_darwinii}}';
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
bibkey = 'KubiPian2012'; type = 'Article'; bib = [ ... 
'author = {Erika Kubisch and Carla Piantoni and Jorge Williams and Alejandro Scolaro and Carlos A. Navas and Nora R. Ibarg\"{u}engoyt\''{i}a}, ' ... 
'year = {2012}, ' ...
'title = {Do Higher Temperatures Increase Growth in the Nocturnal Gecko \emph{Homonota darwini} ({G}ekkota: {P}hyllodactylidae)? {A} Skeletochronological Assessment Analyzed at Temporal and Geographic Scales}, ' ...
'pages = {587-595}, ' ...
'volume = {46}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
